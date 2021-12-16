" https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-cht.sh
" https://github.com/jessarcher/dotfiles -- https://github.com/anishathalye/dotbot
" https://github.com/mhartington/dotfiles/tree/main/config/nvim/lua/mh - vim for frontend
" https://www.bugsnag.com/blog/tmux-and-vim\
" https://github.com/christoomey/vim-tmux-navigator
" https://blog.sher.pl/2014/03/21/how-to-boost-your-vim-productivity/

""" General settings

filetype plugin indent on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd
set list listchars=trail:»,tab:»-
" set listchars=tab:▸\ ,trail:·
set fillchars+=vert:\ 
set nowrap breakindent
set encoding=utf-8
set number
set title
set relativenumber
set scrolloff=4
set sidescrolloff=8
set noshowmode " lualine shows it


" https://github.com/jessarcher/dotfiles
" set hidden
" set signcolumn=yes:2
" set termguicolors
" set undofile
" set spell
" set wildmode=longest:full,full
" set mouse=a
" set nojoinspaces
" set splitright
" set confirm
" set exrc
" set backup
" set backupdir=~/.local/share/nvim/backup//
" set updatetime=300 " Reduce time for highlighting other references
" set redrawtime=10000 " Allow more time for loading syntax on large files



""" Coloring
syntax on
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Opaque Background (Comment out to use terminal's profile)
set termguicolors

" let g:nord_contrast = v:true
" let g:nord_borders = v:false
" let g:nord_disable_background = v:true
" let g:nord_italic = v:true
" colorscheme nord


""" Custom Mappings
" nnoremap <SPACE> <Nop>
"let mapleader=","
let mapleader = "\<Space>"
nnoremap <leader>vs :source $MYVIMRC<CR> " Source init.vim
nnoremap <leader>ve :edit ~/.config/nvim/init.vim<CR> " Edit init.vim

nmap <leader>k :nohlsearch<CR> " Remove search highlights
nmap <leader>= :WhichKey<CR>

map gf :edit <cfile><cr> " Open file that does not exist

imap jj <esc> " Quicky escape to normal mode
imap ;; <Esc>A;<Esc> " Add ; to end of the line

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" Automatically install vim-plug
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugin_config/vim_be_good.vim
source ~/.config/nvim/plugin_config/commentary.vim
source ~/.config/nvim/plugin_config/hop.vim
source ~/.config/nvim/plugin_config/lsp_config.vim
source ~/.config/nvim/plugin_config/lsp_saga.vim

source ~/.config/nvim/plugin_config/lualine.vim
source ~/.config/nvim/plugin_config/nerdtree.vim

source ~/.config/nvim/plugin_config/theme_nord.vim

source ~/.config/nvim/plugin_config/vim-floaterm.vim
source ~/.config/nvim/plugin_config/which-key.vim

call plug#end()

doautocmd User PlugLoaded

" https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
lua require('basic')
" lua require'hop'.setup()
