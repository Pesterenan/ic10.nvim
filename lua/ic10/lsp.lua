local M = {}

---@param dispatchers table
local function create_server(dispatchers)
  local closing = false

  return {
    request = function(method, params, callback)
      return true, 1
    end,
    notify = function(method, params) end,
    is_closing = function()
      return closing
    end,
    terminate = function()
      closing = true
    end,
  }
end

M.client_config = {
  name = "ic10-lsp",
  filetypes = { "ic10" },
  root_dir = (vim.uv or vim.loop).cwd(),
  cmd = create_server,
  on_attach = function(client, bufnr)
  end,
  capabilities = (function()
  end)(),
}

return M
