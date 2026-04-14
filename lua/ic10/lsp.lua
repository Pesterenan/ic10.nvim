local LSP_NAME = "ic10-lsp"
local LSP_VERSION = "0.1.0"

local hover = require("ic10.handlers.hover")
local definition = require("ic10.handlers.definition")

local M = {}

local config = { debug = false }

-- Conditional Log function
local function log(...)
  if config.debug then
    vim.notify(string.format(...), vim.log.levels.INFO)
  end
end

---@param dispatchers table
local function create_server(dispatchers)
  local closing = false
  return {
    request = function(method, params, callback)
      log("IC10 LSP - Request: %s", method)
      if method == "initialize" then
        local result = {
          capabilities = {
            definitionProvider = true,
            hoverProvider = true,
          },
          serverInfo = {
            name = LSP_NAME,
            version = LSP_VERSION,
          },
        }
        callback(nil, result)
      elseif method == "textDocument/hover" then
        hover.on_hover(params, callback)
      elseif method == "textDocument/definition" then
        definition.on_definition(params, callback)
      elseif method == "shutdown" then
        callback(nil, nil)
        closing = true
      else
        callback(nil, {})
      end
    end,
    notify = function(method, params)
      log("IC10 LSP - Notification: %s", method)
      if method == "initialized" then
        log("IC10 LSP - Server Started")
      elseif method == "textDocument/didOpen" then
        log("IC10 LSP - File Opened: %s", params.textDocument.uri)
      elseif method == "exit" then
        closing = true
      end
    end,
    is_closing = function()
      return closing
    end,
    terminate = function()
      closing = true
      log("IC10 LSP - Server terminated.")
    end,
  }
end

M.client_config = {
  name = LSP_NAME,
  filetypes = { "ic10" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]) or vim.fn.getcwd(),
  cmd = create_server,
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.api.nvim_create_autocmd("BufDelete", {
      buffer = bufnr,
      callback = function ()
        require("ic10.utils.symbols").clear_cache(bufnr)
      end,
    })
  end,
  capabilities = (function()
    local caps = vim.lsp.protocol.make_client_capabilities()
    return caps
  end)(),
}

M.setup = function(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
end

return M
