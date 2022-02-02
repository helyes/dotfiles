Plug 'neovim/nvim-lspconfig'

" https://github.com/neovim/nvim-lspconfig#keybindings-and-completion

" Typescript:
" https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
" npm install -g typescript typescript-language-server
" npm install -g diagnostic-languageserver
" npm i -g eslint_d prettier

function LspConfigSetup()
lua << END
  local nvim_lsp = require('lspconfig')
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- Mappings
    -- local opts = { noremap=true, silent=true }
    local opts = { noremap=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  end
  -- TypeScript
  nvim_lsp.tsserver.setup {
    on_attach = on_attach
  } 

  nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
    init_options = {
      linters = {
        eslint = {
          command = 'eslint_d',
          rootPatterns = { '.git' },
          debounce = 100,
          args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
          sourceName = 'eslint_d',
          parseJson = {
            errorsRoot = '[0].messages',
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[eslint] ${message} [${ruleId}]',
            security = 'severity'
          },
          securities = {
            [2] = 'error',
            [1] = 'warning'
          }
        },
      },
      filetypes = {
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
      },
      formatters = {
        eslint_d = {
          command = 'eslint_d',
          args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
          rootPatterns = { '.git' },
        },
        prettier = {
          command = 'prettier',
          args = { '--stdin-filepath', '%filename' }
        }
      },
      formatFiletypes = {
        css = 'prettier',
        javascript = 'eslint_d',
        javascriptreact = 'eslint_d',
        json = 'prettier',
        scss = 'prettier',
        less = 'prettier',
        typescript = 'eslint_d',
        typescriptreact = 'eslint_d',
        json = 'prettier',
        markdown = 'prettier',
      }
    }
  }
END

nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>

endfunction

augroup LspConfigSetup
    autocmd!
    autocmd User PlugLoaded call LspConfigSetup()
augroup END