" Plug 'glepnir/lspsaga.nvim'
" Fixing: lspsaga/codeaction.lua:132: attempt to concatenate field 'title' (a nil value)
Plug 'tami5/lspsaga.nvim' 

function LspSagaSetup()
lua << END
local saga = require 'lspsaga'
 -- saga.init_lsp_saga()
  
  saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    border_style = "round",
  }
END

" https://github.com/glepnir/lspsaga.nvim
nnoremap K <CMD>lua require('lspsaga.hover').render_hover_doc()<CR>

inoremap <C-k> <CMD>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap gs <CMD>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap gh <CMD>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap gr <CMD>lua require('lspsaga.rename').rename()<CR>
nnoremap gp <CMD>lua require'lspsaga.provider'.preview_definition()<CR>

nnoremap <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <leader>cd <CMD>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

endfunction

augroup LspSagaSetup
    autocmd!
    autocmd User PlugLoaded call LspSagaSetup()
augroup END
