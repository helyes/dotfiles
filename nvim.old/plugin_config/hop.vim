Plug 'phaazon/hop.nvim'

function HopSetup()
lua << END
require'hop'.setup()
END

nnoremap <C-h> :HopChar1<CR>
nnoremap <C-h><C-h> :HopChar2<CR>
" <Option> h
nnoremap  ˙ :HopWord<CR>

" lua << END
" vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
" vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
" END

endfunction


augroup HopSetup
    autocmd!
    autocmd User PlugLoaded call HopSetup()
augroup END
