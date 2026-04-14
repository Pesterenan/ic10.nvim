local utils = require("ic10.utils.buffer")
local symbols = require("ic10.utils.symbols")

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

  local all_symbols = symbols.get_symbols(bufnr)
  -- 1. Procura como label
    local label_def = all_symbols.labels[word]
    if label_def then
        return callback(nil, {
            uri = uri,
            range = {
                start = { line = label_def.line, character = label_def.character },
                ['end'] = { line = label_def.line, character = label_def.character },
            },
        })
    end

    -- 2. Procura como define
    local define_def = all_symbols.defines[word]
    if define_def then
        return callback(nil, {
            uri = uri,
            range = {
                start = { line = define_def.line, character = define_def.character },
                ['end'] = { line = define_def.line, character = define_def.character },
            },
        })
    end

    -- 3. Procura como alias
    local alias_def = all_symbols.aliases[word]
    if alias_def then
        return callback(nil, {
            uri = uri,
            range = {
                start = { line = alias_def.line, character = alias_def.character },
                ['end'] = { line = alias_def.line, character = alias_def.character },
            },
        })
    end

    -- Nada encontrado
    callback(nil, nil)
end

return M
