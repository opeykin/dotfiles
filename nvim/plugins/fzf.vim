Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

nmap <leader>ff :Files<cr>
nmap <leader>fa :Ag<cr>
nmap <leader>fw :Ag <C-R><C-W><CR>
nmap <leader>b :Buffers<cr>
nmap <leader>e :Buffers<cr>
nmap <leader>fh :History<cr>
nmap <leader>ti :BTags<cr>
nmap <leader>tt :Tags<cr>
