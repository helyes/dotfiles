local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.opt.relativenumber = true

-- highlight yank
vim.cmd[[
augroup highlight_yank
autocmd!
" au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=200})
augroup END
]]

-- remap "q" to close window
autocmd({ "FileType" }, {
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
autocmd({ "BufWritePre" }, {
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

-- Global functions, do not abuse
-- run as: lua AHI(require("core.mappings"))
AHI = function(inspectable)
  print(vim.inspect(inspectable))
  return inspectable
end

-- AHRELOAD = function(...)
--   return require("plenary.reload").reload_module(...)
-- end

-- AHR = function(name)
--   AHRELOAD(name)
--   return require(name)
-- end

AHRA = function(plugin)
  local regex = "^" .. plugin
  for k in pairs(package.loaded) do
    if k:match(regex) then
      print("Dumping " .. k)
      package.loaded[k] = nil
    end
  end
  print("Requiring " .. plugin)
  return require(plugin)
end

