"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=2
set tabstop=2
set number
set title
set ignorecase
set smartcase
set nowrap
set scrolloff=4
set sidescrolloff=4
set hidden
set cursorline
set termguicolors
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit $MYVIMRC<cr>
nmap <leader>vr :source $MYVIMRC<cr>
nmap <leader>te :edit ~/.tmux.conf<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

nnoremap <leader>u :checktime<cr>

nnoremap <leader>al :silent !arc lint -a %<cr>

nnoremap <Leader>sa :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
nnoremap <Leader>si :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>

nnoremap <leader>o :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" toggle highlight
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

nnoremap <leader>gb :execute "!git blame -L" . line('.') . "," . line('.') . " %"<CR>

" Alt-j/k to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <leader>y "*y
nnoremap <leader>Y "*Y
vnoremap <leader>y "*y

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/sainnhe-everforest.vim
source ~/.config/nvim/plugins/octol-vim-cpp-enhanced-highlight.vim
source ~/.config/nvim/plugins/solarnz-thrift.vim

call plug#end()

"TODO: move to a dedicated folder with a callback
colorscheme everforest

autocmd BufNewFile,BufRead *.cconf ++nested set syntax=python
autocmd BufNewFile,BufRead *.cinc ++nested set syntax=python
autocmd BufNewFile,BufRead *.thrift-cvalidator ++nested set syntax=python
autocmd BufNewFile,BufRead TARGETS ++nested set syntax=python

"--------------------------------------------------------------------------
" Functions
"--------------------------------------------------------------------------

function! DelTags()
  let resp = system('rm ' . getcwd() . '/tags')
endfunction

nnoremap <Leader>td :call DelTags()<cr>
