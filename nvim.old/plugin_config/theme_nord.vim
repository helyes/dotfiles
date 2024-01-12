Plug 'shaunsingh/nord.nvim'

let g:nord_contrast = v:true
let g:nord_borders = v:false
let g:nord_disable_background = v:true
let g:nord_italic = v:true

" Set colorscheme after all plugins loaded - doautocmd User PlugLoaded
autocmd User PlugLoaded ++nested colorscheme nord

