Plug 'folke/which-key.nvim'

function WhichKeySetup()
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
EOF
endfunction

augroup WhichKeySetup
    autocmd!
    autocmd User PlugLoaded call WhichKeySetup()
augroup END
