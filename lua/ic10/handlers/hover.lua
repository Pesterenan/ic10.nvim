local M = {}

local function format_hover_content(word, data)
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

M.on_hover = function(params, callback)
  local word = require("ic10.utils.buffer").get_word_at_params(params)
  if word == "" then
    return callback(nil, nil)
  end

  local constants = require("ic10.constants")
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
      local contents = format_hover_content(word, data)
      return callback(nil, { contents = contents })
    end
  end
  callback(nil, nil)
end

return M
