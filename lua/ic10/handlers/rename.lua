local buffer_utils = require("ic10.utils.buffer")
local symbols_utils = require("ic10.utils.symbols")

local M = {}

function M.prepare_rename(params,callback)
  local word = buffer_utils.get_word_at_params(params)
  if word == "" then
    return callback(nil, nil)
  end

  buffer_utils.log("preparing rename for word: '%s'", word)

  local bufnr = vim.uri_to_bufnr(params.textDocument.uri)
  local symbols = symbols_utils.get_symbols(bufnr)
  local is_renameable = symbols.aliases[word] or symbols.defines[word] or symbols.labels[word]

  if not is_renameable then
    buffer_utils.log("word '%s' is not renameable", word)
    return callback(nil, nil)
  end

  local line = vim.api.nvim_buf_get_lines(bufnr, params.position.line, params.position.line + 1, false)[1]
  local _, start_col = line:find(word, params.position.character - #word + 1, true)

  local range = {
    start = { line = params.position.line, character = start_col - 1 },
    ["end"] = { line = params.position.line, character = start_col - 1 + #word },
  }
  buffer_utils.log("returning range: %s", vim.inspect(range))
  callback(nil, range)
end

function M.rename(params,callback)
  local bufnr = vim.uri_to_bufnr(params.textDocument.uri)
  local old_name = buffer_utils.get_word_at_params(params)
  local new_name = params.newName

  if old_name == "" then
    return callback(nil, nil)
  end

  buffer_utils.log("rename called: '%s' -> '%s'", old_name, new_name)

  local symbols = symbols_utils.get_symbols(bufnr)
  local sym_type = nil
  if symbols.labels[old_name] then
    sym_type = "label"
  elseif symbols.aliases[old_name] then
    sym_type = "alias"
  elseif symbols.defines[old_name] then
    sym_type = "define"
  else
    buffer_utils.log("type of symbol unidentified: '%s'", old_name)
    return callback(nil, nil)
  end

  buffer_utils.log("type of symbol: %s", sym_type)

  local refs = symbols_utils.find_all_references(bufnr, old_name, sym_type)
  buffer_utils.log("total references: %d", #refs)

  local changes = {}
  for _, range in ipairs(refs) do
    table.insert(changes, {
      range = range,
      newText = new_name,
    })
  end

  local workspace_edit = {
    changes = {
      [params.textDocument.uri] = changes,
    },
  }

  callback(nil, workspace_edit)
end

return M
