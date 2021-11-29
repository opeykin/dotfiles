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
set mouse=a
set scrolloff=4
set sidescrolloff=4

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

