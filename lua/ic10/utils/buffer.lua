local M = {}

M.config = { debug = false }

-- Conditional Log function
M.log = function(...)
  if M.config.debug then
    local header = "[IC10 LSP]: "
    local log = string.format(...)
    vim.notify(header .. log, vim.log.levels.INFO)
  end
end


--- Obtém a palavra sob o cursor em um buffer IC10, com base nos parâmetros de posição do LSP.
--- @param params table Parâmetros da requisição LSP contendo `textDocument.uri` e `position`.
--- @return string A palavra encontrada ou string vazia.
M.get_word_at_params = function(params)
  -- Converte a URI do documento para o número do buffer no Neovim.
  local bufnr = vim.uri_to_bufnr(params.textDocument.uri)

  -- Verifica se o buffer está carregado. Se não estiver, não há como ler o conteúdo.
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    return ""
  end

  local line_idx = params.position.line
  local col = tonumber(params.position.character) or 0
  local line = vim.api.nvim_buf_get_lines(bufnr, line_idx, line_idx + 1, false)[1] or ""

  -- Itera sobre todas as ocorrências de palavras válidas na linha.
  -- O padrão Lua [%w.]+ captura sequências de letras, números e pontos.
  -- Usamos gmatch com três capturas: (posição inicial, palavra, posição final)
  for start_pos, word, end_pos in line:gmatch("()([%w.]+)()") do
    -- Verifica se a posição do cursor está dentro dos limites da palavra encontrada.
    if (start_pos - 1) <= col and col <= (end_pos - 1) then
      -- Remove o ':' do final, caso seja um rótulo (ex.: "loop:" → "loop").
      -- Isso permite que o hover funcione tanto em "loop" quanto em "loop:".
      return word:gsub(":$", "")
    end
  end

  return ""
end

local instruction_pattern = "^%s*([%w]+)%s*(.*)$"

--- Analisa a linha atual e retorna informações de contexto para completion.
---@param line string Linha completa até a posição do cursor (coluna 0‑indexada).
---@param cursor_col number Coluna do cursor (0‑indexada).
---@return table|nil Contexto { instr = string, arg_index = number, args_before = table }
function M.get_context(line, cursor_col)
    local text_before_cursor = line:sub(1, cursor_col)
    local trimmed = text_before_cursor:match("^%s*(.*)$")
    if not trimmed or trimmed == "" then
        return nil
    end

    local instr, args_str = trimmed:match("^([%w_]+)%s*(.*)$")
    if not instr then
        return nil
    end

    local args = {}
    for arg in args_str:gmatch("%S+") do
        table.insert(args, arg)
    end

    -- Determina arg_index
    local arg_index
    if args_str == "" then
        -- Nenhum argumento escrito ainda.
        -- Se o último caractere antes do cursor for espaço, estamos após "instr " => arg_index = 1 (próximo argumento)
        -- Senão, cursor está colado em "instr" => arg_index = 0 (completar instrução)
        if text_before_cursor:match("%s$") then
            arg_index = 1
        else
            arg_index = 0
        end
    else
        local last_char = text_before_cursor:sub(-1)
        if last_char == " " or last_char == "\t" then
            arg_index = #args + 1
        else
            arg_index = math.max(1, #args)
        end
    end

    return {
        instr = instr,
        arg_index = arg_index,
        args_before = args,
    }
end

return M
