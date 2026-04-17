local buffer_utils = require("ic10.utils.buffer")
local constants = require("ic10.constants")
local symbols_utils = require("ic10.utils.symbols")

local M = {}

---Format an instruction signature argument list to a snippet list
---Example: `sum [r?] [a] [b]` -> `sum {1:r?} {2:a} {3:b}`
---@param signature string The instruction's signature
local function format_signature_to_snippet(signature)
  local i = 1
  return signature:gsub("%[([^%]]+)%]", function(arg)
    local placeholder = string.format("${%d:%s}", i, arg)
    i = i + 1
    return placeholder
  end)
end

local arg_types_cache = {}
local function get_arg_types(instr)
  instr = instr:lower()
  if arg_types_cache[instr] then
    return arg_types_cache[instr]
  end
  local instruction = constants.operators[instr]
  if not instruction then
    return {}
  end
  local types = {}
  for arg in instruction.signature:gmatch("%[([^%]]+)%]") do
    table.insert(types, arg)
  end
  arg_types_cache[instr] = types
  return types
end

---Generate a list of instructions and their snippets
---@param instr string Part of the typed instruction
---@return table items List with matches and their snippets
local function get_snippet_items(instr)
  local prefix = instr:lower()
  local items = {}
  for name, op in pairs(constants.operators) do
    if name:sub(1, #prefix) == prefix then
      local snippet_text = format_signature_to_snippet(op.signature)
      table.insert(items, {
        label = name .. " ...",
        kind = 15, -- Snippet
        insertText = snippet_text,
        insertTextFormat = 2, -- Snippet format
        documentation = {
          kind = "markdown",
          value = string.format(
            "**%s** (%s)\n\n%s\n\nSignature: `%s`",
            name,
            op.category or "instruction",
            op.description or "",
            op.signature or ""
          ),
        },
      })
    end
  end
  return items
end

---Generate a list of completion for arguments
---@param instr string Part of the typed argument
---@param arg_index number Current index of the argument in the signature
---@param bufnr number Buffer number
---@return table items List with matches for the argument
local function get_argument_items(instr, arg_index, bufnr)
  local arg_types = get_arg_types(instr)
  local expected = arg_types[arg_index]
  if not expected then
    return {}
  end

  local items = {}
  local symbols = symbols_utils.get_symbols(bufnr)

  -- Labels for 'addr':
  if expected:find("addr") then
    for name, data in pairs(symbols.labels) do
      table.insert(items, {
        label = name,
        kind = 14,
        detail = "Label (line " .. (data.line + 1) .. ")",
        insertText = name,
        insertTextFormat = 1,
      })
    end
    for _, reg in ipairs(constants.REGISTERS) do
      table.insert(items, {
        label = reg,
        kind = 13, -- Enum
        insertText = reg,
      })
    end
  end

  -- Aliases and Registers for 'r?':
  if expected:find("r%?") or expected:find("d%?") then
    -- Adds aliases defined by the user which points to a register
    for name, data in pairs(symbols.aliases) do
      table.insert(items, {
        label = name,
        kind = 12, -- Value
        detail = "Alias for " .. data.register,
        insertText = name,
      })
    end
    if expected:find("r") then
      for _, reg in ipairs(constants.REGISTERS) do
        table.insert(items, {
          label = reg,
          kind = 13, -- Enum
          insertText = reg,
        })
      end
    end
    if expected:find("d") then
      for _, dev in ipairs(constants.DEVICES) do
        table.insert(items, {
          label = dev,
          kind = 13, -- Enum
          insertText = dev,
        })
      end
    end
  end

  -- Constants: (LogicTypes, LogicSlotTypes, Batch Modes, Reagent Modes):
  if
    expected:find("logicType")
    or expected:find("logicSlotType")
    or expected:find("batchMode")
    or expected:find("reagentMode")
  then
    local source_table = expected:find("Slot") and constants.types.logic_slot_types
      or expected:find("batch") and constants.types.batch_modes
      or expected:find("reagent") and constants.types.reagent_modes
      or constants.types.logic_types
    if source_table then
      for name, data in pairs(source_table) do
        table.insert(items, {
          label = name,
          kind = 25, -- Type
          detail = string.format(
            "%s\n\n%s",
            data.description or "",
            (data.value ~= nil and "Value: " .. data.value) or ""
          ),
          insertText = name,
          insertTextFormat = 1,
        })
      end
    end
  end

  -- Hash arguments, user defined or HASH(...) snippet
  if expected:find("Hash") then
    -- Adds constants defined by the user
    for name, data in pairs(symbols.defines) do
      table.insert(items, {
        label = name,
        kind = 12, -- Value
        detail = "Value: " .. data.value,
        insertText = name,
      })
    end
    table.insert(items, {
      label = 'HASH("")',
      kind = 15, -- Snippet
      insertText = 'HASH("${1:string}")',
      insertTextFormat = 2,
      documentation = {
        kind = "markdown",
        value = "Insert a HASH string literal",
      },
    })
  end

  return items
end

M.on_completion = function(params, callback)
  vim.schedule(function()
    local bufnr = vim.uri_to_bufnr(params.textDocument.uri)
    local line = vim.api.nvim_buf_get_lines(bufnr, params.position.line, params.position.line + 1, false)[1]

    local ctx = buffer_utils.get_context(line, params.position.character)
    if not ctx then
      return callback(nil, { isIncomplete = false, items = {} })
    end

    local items = {}

    if ctx.arg_index == 0 then
      items = get_snippet_items(ctx.instr)
    else
      items = get_argument_items(ctx.instr, ctx.arg_index, bufnr)
    end
    callback(nil, { isIncomplete = false, items = items })
  end)
end

return M
