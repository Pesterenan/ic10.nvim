local buffer_utils = require("ic10.utils.buffer")
local symbols_utils = require("ic10.utils.symbols")

local M = {}

M.on_definition = function(params, callback)
  local word = buffer_utils.get_word_at_params(params)
  if word == "" then
    return callback(nil, nil)
  end

  local uri = params.textDocument.uri
  local bufnr = vim.uri_to_bufnr(uri)
  if bufnr == 0 then
    return callback(nil, nil)
  end

  local symbols = symbols_utils.get_symbols(bufnr)

  local label_def = symbols.labels[word]
  if label_def then
    return callback(nil, {
      uri = uri,
      range = {
        start = { line = label_def.line, character = label_def.character },
        ["end"] = { line = label_def.line, character = label_def.character },
      },
    })
  end

  local define_def = symbols.defines[word]
  if define_def then
    return callback(nil, {
      uri = uri,
      range = {
        start = { line = define_def.line, character = define_def.character },
        ["end"] = { line = define_def.line, character = define_def.character },
      },
    })
  end

  local alias_def = symbols.aliases[word]
  if alias_def then
    return callback(nil, {
      uri = uri,
      range = {
        start = { line = alias_def.line, character = alias_def.character },
        ["end"] = { line = alias_def.line, character = alias_def.character },
      },
    })
  end

  callback(nil, nil)
end

return M
