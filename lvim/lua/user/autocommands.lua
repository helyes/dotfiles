-- remap "q" to close window
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

-- remove trailing whitespaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {
    "*.fish",
    "*.js",
    "*.lua",
    "*.md",
    "*.rb",
    "*.rs",
    "*.tf",
    "*.ts",
  },
  callback = function()
    vim.cmd [[
      :%s/\s\+$//e
    ]]
  end,
})
