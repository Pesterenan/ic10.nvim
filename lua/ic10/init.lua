local M = {}

M.setup = function()
  -- Add ic10 filetype
  vim.filetype.add({
    extension = {
      ic10 = "ic10",
    },
  })

  -- LSP Configuration and Start
  local lsp = require("ic10.lsp")
  local config = lsp.client_config

  -- Registering LSP
  if vim.lsp.config then
    vim.lsp.config["ic10"] = config

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ic10",
      callback = function(args)
        vim.lsp.enable("ic10", { bufnr = args.buf })
      end,
    })
  end
end

return M
