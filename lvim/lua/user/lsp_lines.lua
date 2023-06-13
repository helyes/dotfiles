local status_ok, p = pcall(require, "lsp_lines")
if not status_ok then
  print("!!!Lsp_lines plugin not loaded")
  return
end

p.setup({})

-- Disable virtual_text since it's redundant due to lsp_lines
vim.diagnostic.config({ virtual_text = false })

local M = {}

-- Toggle lsp_lines and virtual text and showing only one of them
M.toggle = function()
  -- flip lsp_lines
   p.toggle()
  -- flip virtual text
  vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_lines })
end

return M

