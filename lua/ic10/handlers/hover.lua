local M = {}

local symbols = require("ic10.utils.symbols")
local constants = require("ic10.constants")

local function format_constant_hover(word, data)
  local lines = {
    "**" .. word .. "** (" .. (data.category or "unknown") .. ") - IC10",
    "---",
  }
  if data.signature then
    table.insert(lines, "Signature: `" .. data.signature .. "`")
  end
  if data.value ~= nil then
    table.insert(lines, "Value: " .. tostring(data.value))
  end
  if data.description then
    table.insert(lines, "")
    table.insert(lines, data.description)
  end
  if data.example then
    table.insert(lines, "")
    table.insert(lines, "Example: " .. data.example)
  end
  return { kind = "markdown", value = table.concat(lines, "\n") }
end

local function format_user_defined(word, data)
  local lines = {
    "**" .. word .. "** (" .. data.type .. ") - IC10",
    "---",
  }
  if data.value then
    table.insert(lines, "Value: `" .. data.value .. "`")
  elseif data.register then
    table.insert(lines, "Register: `" .. data.register .. "`")
  end
  table.insert(lines, "Line: " .. (data.line + 1))
  return { kind = "markdown", value = table.concat(lines, "\n") }
end

M.on_hover = function(params, callback)
  local word = require("ic10.utils.buffer").get_word_at_params(params)
  if word == "" then
    return callback(nil, nil)
  end

  local bufnr = vim.uri_to_bufnr(params.textDocument.uri)
  local sym = symbols.get_symbols(bufnr)
  local user_symbols = {
    { table = sym.defines, type = "define" },
    { table = sym.aliases,  type = "alias"  },
    { table = sym.labels,   type = "label"  },
  }

  for _, entry in ipairs(user_symbols) do
    local data = entry.table[word]
    if data then
      data.type = entry.type
      return callback(nil, { contents = format_user_defined(word, data) })
    end
  end

  local operators = constants.operators
  local types = constants.types

  local sources = {
    operators,
    types.logic_types,
    types.logic_slot_types,
    types.system,
    types.batch_modes,
    types.reagent_modes,
  }

  for _, source in ipairs(sources) do
    local data = source[word]
    if data then
      local contents = format_constant_hover(word, data)
      return callback(nil, { contents = contents })
    end
  end
  callback(nil, nil)
end

return M
