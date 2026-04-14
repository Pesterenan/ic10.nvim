local M = {}

local cache = {}

M.scan_buffer = function(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local symbols = {
    labels = {},
    defines = {},
    aliases = {},
  }

  for i, line in ipairs(lines) do
    local line_nr = i - 1
    -- Label match `name:`
    local label_name = line:match("^%s*([%w]+):")
    if label_name then
      symbols.labels[label_name] = { line = line_nr, character = 0 }
    end

    -- Define match `define NAME value`
    local define_name, define_value = line:match("^%s*define%s+([%w]+)%s+(.+)$")
    if define_name then
      symbols.defines[define_name] = {
        line = line_nr,
        character = line:find("define") + 6,
        value = define_value,
      }
    end

    -- Alias: alias NAME register
    local alias_name, alias_reg = line:match("^%s*alias%s+([%w_]+)%s+([%w_]+)")
    if alias_name and alias_reg then
      -- Validates if its a valid register (r0-r99, ra, db, sp, etc.)
      if
        alias_reg:match("^[rR]%d+$")
        or alias_reg:match("^[dD]%d+$")
        or alias_reg:match("^ra$")
        or alias_reg:match("^db$")
        or alias_reg:match("^sp$")
      then
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

M.get_symbols = function(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local mtime = vim.fn.getftime(bufname)

  if mtime == -1 then
    return M.scan_buffer(bufnr)
  end
  local cached = cache[bufnr]
  if cached and cached.mtime == mtime then
    return cached.symbols
  end
  local symbols = M.scan_buffer(bufnr)
  cache[bufnr] = { symbols = symbols, mtime = mtime }
  return symbols
end

M.clear_cache = function(bufnr)
  cache[bufnr] = nil
end

return M
