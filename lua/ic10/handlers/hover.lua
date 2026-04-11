local M = {}

local function get_word_at_params(params)
  local bufnr = vim.uri_to_bufnr(params.textDocument.uri)
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    return ""
  end
  local line_idx = params.position.line
  local col = tonumber(params.position.character) or 0
  local line = vim.api.nvim_buf_get_lines(bufnr, line_idx, line_idx + 1, false)[1] or ""

  for s, w, e in line:gmatch("()([%w_.:$]+)()") do
    if (s - 1) <= col and col <= (e - 1) then
      return w:gsub(":$", "") -- Remove ':' se for um label
    end
  end
  return ""
end

M.on_hover = function(params, callback)
  local word = get_word_at_params(params)
  if word == "" then
    return callback(nil, nil)
  end

  local operators = require("ic10.constants.operators")
  local data = operators[word]
  if data then
    local content = {
      "**" .. word .. "** (" .. data.category .. ") - IC10",
      "---",
      "Signature: `" .. data.signature .. "`",
      "",
      data.description,
      (data.example and ("Example: " .. data.example) or ""),
    }
    callback(nil, { contents = { kind = "markdown", value = table.concat(content, "\n") } })
  end
end

return M
