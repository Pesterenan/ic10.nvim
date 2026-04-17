local buffer_utils = require("ic10.utils.buffer")
local constants = require("ic10.constants")

local M = {}

local symbols_cache = {}

M.scan_buffer = function(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local symbols = {
    labels = {},
    defines = {},
    aliases = {},
  }

  for i, line in ipairs(lines) do
    local line_nr = i - 1
    -- Label match: `name:`
    local label_name = line:match("^%s*(%w+):")
    if label_name then
      symbols.labels[label_name] = { line = line_nr, character = 0 }
    end

    -- Define match: `define NAME value`
    local define_name, define_value = line:match("^%s*define%s+(%w+)%s+(.+)$")
    if define_name then
      symbols.defines[define_name] = {
        line = line_nr,
        character = line:find("define") + 6,
        value = define_value,
      }
    end

    -- Alias match: alias NAME register
    local alias_name, alias_reg = line:match("^%s*alias%s+(%w+)%s+(%w+)")
    if alias_name and alias_reg then
      -- Validates if its a valid register or device
      if vim.tbl_contains(constants.DEVICES, alias_reg) or vim.tbl_contains(constants.REGISTERS, alias_reg) then
        symbols.aliases[alias_name] = {
          line = line_nr,
          character = line:find("alias") + 5,
          register = alias_reg,
        }
      end
    end
  end

  return symbols
end

function M.get_symbols(bufnr)
  local changedtick = vim.api.nvim_buf_get_changedtick(bufnr)
  local key = bufnr .. ":" .. changedtick

  if symbols_cache[key] then
    return symbols_cache[key]
  end

  local symbols_data = M.scan_buffer(bufnr)

  -- Limpa entradas antigas do mesmo buffer para evitar acúmulo
  for k, _ in pairs(symbols_cache) do
    if k:match("^" .. bufnr .. ":") then
      symbols_cache[k] = nil
    end
  end
  symbols_cache[key] = symbols_data
  return symbols_data
end

function M.invalidate_cache(bufnr)
  for k, _ in pairs(symbols_cache) do
    if k:match("^" .. bufnr .. ":") then
      symbols_cache[k] = nil
    end
  end
end

---Finds all the symbol's references (alias, define, label) on the buffer.
---@param bufnr number: Buffer number
---@param symbol_name string: Symbol to be searched for
---@param symbol_type string: "alias", "define", or "label".
---@return table: A list of LSP ranges, each with a `start` and `end`.
function M.find_all_references(bufnr, symbol_name, symbol_type)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local references = {}

  -- Auxiliary function to add a reference
  local function add_reference(line_nr, start_col, end_col)
    table.insert(references, {
      start = { line = line_nr, character = start_col },
      ["end"] = { line = line_nr, character = end_col },
    })
  end

  for lnum, line in ipairs(lines) do
    local line_nr = lnum - 1

    local sym_def_pattern = symbol_type == "label" and "^%s*" .. symbol_name .. ":"
      or "^%s*" .. symbol_type .. "%s+" .. symbol_name
    local def_start, _ = line:find(sym_def_pattern)
    if def_start then
      local name_start = line:find(symbol_name, def_start)
      add_reference(line_nr, name_start - 1, name_start + #symbol_name - 1)
    end
    local sym_arg_pattern = "%f[%a]" .. symbol_name .. "%f[%A]"
    local start_idx = 1
    while true do
      local start_col, end_col = line:find(sym_arg_pattern, start_idx)
      if not start_col then break end

      local is_definition_line = line:match(sym_def_pattern)
      if not is_definition_line then
        add_reference(line_nr, start_col - 1, end_col)
      end
      start_idx = end_col + 1
    end
  end
  buffer_utils.log(string.format("found %d references for '%s'", #references, symbol_name))
  return references
end

return M
