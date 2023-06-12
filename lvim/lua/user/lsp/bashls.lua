-- BASH
-- https://github.com/bash-lsp/bash-language-server#neovim
require'lspconfig'.bashls.setup{
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|justfile)"
    }
}

