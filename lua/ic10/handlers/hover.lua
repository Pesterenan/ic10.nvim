local M = {}

M.on_hover = function(params)
  return {
    contents = {
      { language = "markdown", value = "Hover test" }
    }
  }
end

return M
