local M = {}

M.setup = function()
  -- Add ic10 filetype
  vim.filetype.add({
    extension = {
      ic10 = "ic10",
    },
  })

  -- Registering LSP Configuration
  local lsp = require("ic10.lsp")
  local config = lsp.client_config
  vim.lsp.config["ic10"] = config

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "ic10",
    callback = function(args)
      vim.lsp.enable("ic10", { bufnr = args.buf })
    end,
  })

  -- Activate if in a ic10 buffer
  if vim.bo.filetype == "ic10" then
    vim.lsp.enable("ic10")
  end
end

return M
