local LSP_NAME = "ic10-lsp"
local LSP_VERSION = "0.1.0"

local buffer_utils = require("ic10.utils.buffer")
local completion = require("ic10.handlers.completion")
local definition = require("ic10.handlers.definition")
local hover = require("ic10.handlers.hover")

local M = {}

---@param dispatchers table
local function create_server(dispatchers)
  local closing = false
  return {
    request = function(method, params, callback)
      -- buffer_utils.log("Request: %s", method)
      if method == "initialize" then
        local result = {
          capabilities = {
            completionProvider = {
              triggerCharacters = { " ", "\t" },
              resolveProvider = false,
            },
            definitionProvider = true,
            hoverProvider = true,
            textDocumentSync = 1,
          },
          serverInfo = {
            name = LSP_NAME,
            version = LSP_VERSION,
          },
        }
        callback(nil, result)
      elseif method == "textDocument/completion" then
        completion.on_completion(params, callback)
      elseif method == "textDocument/hover" then
        hover.on_hover(params, callback)
      elseif method == "textDocument/definition" then
        definition.on_definition(params, callback)
      elseif method == "textDocument/didChange" then
        local bufnr = vim.uri_to_bufnr(params.textDocument.uri)
        require("ic10.utils.symbols").clear_cache(bufnr)
        callback(nil, nil)
      elseif method == "shutdown" then
        callback(nil, nil)
        closing = true
      else
        callback(nil, {})
      end
    end,
    notify = function(method, params)
      buffer_utils.log("Notification: %s", method)
      if method == "initialized" then
        buffer_utils.log("Server Started")
      elseif method == "textDocument/didOpen" then
        buffer_utils.log("File Opened: %s", params.textDocument.uri)
      elseif method == "exit" then
        closing = true
      end
    end,
    is_closing = function()
      return closing
    end,
    terminate = function()
      closing = true
      buffer_utils.log("Server terminated.")
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
      callback = function()
        require("ic10.utils.symbols").clear_cache(bufnr)
      end,
    })
  end,
  capabilities = (function()
    local caps = vim.lsp.protocol.make_client_capabilities()
    local has_blink, blink = pcall(require, "blink.cmp")
    if has_blink then
      caps = vim.tbl_deep_extend("force", caps, blink.get_lsp_capabilities())
    end
    return caps
  end)(),
}

M.setup = function(opts)
  buffer_utils.config = vim.tbl_deep_extend("force", buffer_utils.config, opts or {})
end

return M
