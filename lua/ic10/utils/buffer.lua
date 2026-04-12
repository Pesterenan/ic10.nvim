local M = {}

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

return M
