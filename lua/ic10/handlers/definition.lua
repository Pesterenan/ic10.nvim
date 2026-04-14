local utils = require("ic10.utils.buffer")
local M = {}

M.on_definition = function(params, callback) 
  local word = utils.get_word_at_params(params)
  if word == "" then
    return callback(nil, nil)
  end
  local uri = params.textDocument.uri
  local  bufnr = vim.uri_to_bufnr(uri)
  if bufnr == 0 then
    return callback(nil, nil)
  end

  local line = utils.find_label_definition(bufnr, word)
  if not line then
    return callback(nil, nil)
  end
  local result = {
    uri = uri,
    range = {
      start = { line = line, character = 0},
      ['end'] = { line = line, character = 0},
    },
  }
  callback(nil, result)
end

return M
