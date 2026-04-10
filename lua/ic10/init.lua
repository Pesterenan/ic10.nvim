local M = {}

M.config = {
  debug = false,
}

M.setup = function(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  -- Add ic10 filetype
  vim.filetype.add({ extension = { ic10 = "ic10" } })

  -- Registering LSP Configuration
  local lsp = require("ic10.lsp")
  lsp.setup(M.config)
  local config = lsp.client_config
  vim.lsp.config[config.name] = config

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "ic10",
    callback = function(args)
      vim.lsp.enable(config.name, { bufnr = args.buf })
    end,
  })

  -- Activate if in a ic10 buffer
  if vim.bo.filetype == "ic10" then
    vim.lsp.enable(config.name)
  end
end

return M
