local M = {}

M.setup = function()
  -- 1. Detect .ic10 files
  vim.filetype.add({
    extension = {
      ic10 = "ic10",
    },
  })

end

return M
