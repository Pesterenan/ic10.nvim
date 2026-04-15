local constants = require("ic10.constants")
local symbols = require("ic10.utils.symbols")
local buffer_utils = require("ic10.utils.buffer")
local operators = require("ic10.constants.operators")

local M = {}

local function signature_to_snippet(signature)
  local i = 1
  return signature:gsub("%[([^%]]+)%]", function(arg)
    local placeholder = string.format("${%d:%s}", i, arg)
    i = i + 1
    return placeholder
  end)
end

--- Gera itens de completion para uma instrução recém-digitada.
local function get_snippet_items(instr)
  local prefix = instr:lower()
  local items = {}
  for name, op in pairs(operators) do
    if name:sub(1, #prefix) == prefix then
      local snippet_text = signature_to_snippet(op.signature)
      table.insert(items, {
        label = name .. " ...",
        kind = 15, -- Snippet
        insertText = snippet_text,
        insertTextFormat = 2, -- Snippet format
        documentation = {
          kind = "markdown",
          value = string.format(
            "**%s** (%s)\n\n%s\n\nExample: `%s`",
            name,
            op.category or "instruction",
            op.description or "",
            op.example or ""
          ),
        },
      })
    end
  end
  return items
end

M.on_completion = function(params, callback)
  vim.schedule(function()
    buffer_utils.log("Completion request: %s", vim.inspect(params))
    local bufnr = vim.uri_to_bufnr(params.textDocument.uri)
    local pos = params.position
    local line = vim.api.nvim_buf_get_lines(bufnr, pos.line, pos.line + 1, false)[1] or ""
    local cursor_col = pos.character

    local ctx = buffer_utils.get_context(line, cursor_col)
    if not ctx then
      return callback(nil, { isIncomplete = false, items = {} })
    end

    local items = {}

    buffer_utils.log("Instr: %s", ctx.instr)
    if ctx.arg_index == 0 then
      -- Cursor logo após o mnemônico, sugerir snippet da instrução
      items = get_snippet_items(ctx.instr)
    end

    -- Se não houver itens específicos, podemos sugerir palavras do buffer como fallback
    if #items == 0 then
      -- Fallback: sugestão de palavras já presentes no buffer (opcional)
    end

    buffer_utils.log("Returning %d items", #items)
    callback(nil, { isIncomplete = false, items = items })
  end)
end

return M
