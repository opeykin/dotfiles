
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=2
set tabstop=2
set number
set relativenumber
set termguicolors
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

nnoremap <leader>u :checktime<cr>

nnoremap <Leader>sa :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap <Leader>si :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>

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
source ~/.config/nvim/plugins/octol-vim-cpp-enhanced-highlight.vim
source ~/.config/nvim/plugins/CurtineIncSw.vim

call plug#end()

"TODO: move to a dedicated folder with a callback
colorscheme molokai

"--------------------------------------------------------------------------
" Functions
"--------------------------------------------------------------------------

function! DelTags()
  let resp = system('rm ' . getcwd() . '/tags')
endfunction

nnoremap <Leader>td :call DelTags()<cr>
