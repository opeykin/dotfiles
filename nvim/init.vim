"-------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set number
set relativenumber
"set termguicolors
set title
set ignorecase
set smartcase
set nowrap
set scrolloff=4
set sidescrolloff=4
set hidden

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit $MYVIMRC<cr>
nmap <leader>vr :source $MYVIMRC<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/tomasr-molokai.vim

call plug#end()
