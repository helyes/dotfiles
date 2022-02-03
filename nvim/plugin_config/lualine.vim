Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

function LuaLineSetup()
lua << END

function branch()
  -- :echo len(getbufinfo({'buflisted':1}))
  return 'blah'
end

require'lualine'.setup({
  tabline = {
    lualine_a = {'buffers'},
--    lualine_b = {'branch'},
--    lualine_c = {'filename'},
--    lualine_x = {},
--    lualine_y = {},
--    lualine_z = {'tabs'}
      lualine_z = { branch }
  }
}
)

END
endfunction

augroup LuaLineSetup
    autocmd!
    autocmd User PlugLoaded call LuaLineSetup()
augroup END
