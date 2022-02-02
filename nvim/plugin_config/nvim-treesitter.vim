Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

function TreeSitterSetup()
lua << END
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "toml",
    "fish",
    "json",
    "ruby",
    "typescript",
    "yaml",
    "html",
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
END
endfunction


augroup TreeSitterSetup
    autocmd!
    autocmd User PlugLoaded call TreeSitterSetup()
augroup END