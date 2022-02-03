Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" https://github.com/neovim/nvim-lspconfig#keybindings-and-completion

" Typescript:
" https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
" npm install -g typescript typescript-language-server
" npm install -g diagnostic-languageserver
" npm i -g eslint_d prettier

function LspCommonSetup()
lua << END

 ---------- Setup nvim-cmp --------------
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

   -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 
  ---------- LSP config ----------

  local nvim_lsp = require('lspconfig')
  local protocol = require('vim.lsp.protocol')

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings
    -- local opts = { noremap=true, silent=true }
    local opts = { noremap=true }
    buf_set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', opts)

    -- does not work ?
    protocol.CompletionItemKind1 = {
        '';   -- Text          = 1;
        '';   -- Method        = 2;
        'ƒ';   -- Function      = 3;
        '';   -- Constructor   = 4;
        '識';  -- Field         = 5;
        '';   -- Variable      = 6;
        '';   -- Class         = 7;
        'ﰮ';   -- Interface     = 8;
        '';   -- Module        = 9;
        '';   -- Property      = 10;
        '';   -- Unit          = 11;
        '';   -- Value         = 12;
        '了';  -- Enum          = 13;
        '';   -- Keyword       = 14;
        '﬌';   -- Snippet       = 15;
        '';   -- Color         = 16;
        '';   -- File          = 17;
        '渚';  -- Reference     = 18;
        '';   -- Folder        = 19;
        '';   -- EnumMember    = 20;
        '';   -- Constant      = 21;
        '';   -- Struct        = 22;
        '鬒';  -- Event         = 23;
        'Ψ';   -- Operator      = 24;
        '';   -- TypeParameter = 25;
      }
  end -- on_attach

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --  require('lspconfig')['tsserver'].setup {
  --    capabilities = capabilities
  --  }

  -- TypeScript
  nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
  } 

  -- Ruby
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph
  nvim_lsp.solargraph.setup {
    on_attach = on_attach,
    settings = {
      solargraph = {
        diagnostics = true
      }
    }
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

-- Rust
-- https://sharksforarms.dev/posts/neovim-rust/
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

-- VIM
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls
require('lspconfig').vimls.setup{}

-- BASH
-- https://github.com/bash-lsp/bash-language-server#neovim
require'lspconfig'.bashls.setup{}

END

nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>

endfunction

augroup LspCommonSetup
    autocmd!
    autocmd User PlugLoaded call LspCommonSetup()
augroup END
