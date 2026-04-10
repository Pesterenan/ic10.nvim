LSP_NAME = "ic10-lsp"
LSP_VERSION = "0.1.0"

local M = {}

---@param dispatchers table
local function create_server(dispatchers)
  local closing = false
  return {
    request = function(method, params, callback)
      print("IC10 LSP - Request:", method)
      if method == "initialize" then
        local result = {
          capabilities = {},
          serverInfo = {
            name = LSP_NAME,
            version = LSP_VERSION,
          },
        }
        callback(nil, result)
      elseif method == "shutdown" then
        callback(nil, nil)
        closing = true
      else
        callback(nil, {})
      end
    end,
    notify = function(method, params)
      print("IC10 LSP - Notification:", method)
      if method == "initialized" then
        print("IC10 LSP - Server Started")
      elseif method == "textDocument/didOpen" then
        print("IC10 LSP - File Opened:", params.textDocument.uri)
      elseif method == "exit" then
        closing = true
      end
    end,
    is_closing = function()
      return closing
    end,
    terminate = function()
      closing = true
      print("IC10 LSP - Server terminated.")
    end,
  }
end

M.client_config = {
  name = LSP_NAME,
  filetypes = { "ic10" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]) or vim.fn.getcwd(),
  cmd = create_server,
  on_attach = function(client, bufnr)
    print(string.format("IC10 LSP - Attached to buffer %d successfully!", bufnr))
  end,
  capabilities = (function()
    local caps = vim.lsp.protocol.make_client_capabilities()
    return caps
  end)(),
}

return M
