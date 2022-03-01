Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_preview_window = ['down:70%:hidden', 'ctrl-/']
let g:fzf_tags_command = 'ctags -R --fields=+S'

function! plugins#fzf#btag_cmd()
  let escaped = fzf#shellescape(expand('%'))
  let null = '/dev/null'
  let sort = has('unix') && !has('win32unix') && executable('sort') ? '| sort -s -k 5' : ''
  return printf('ctags -f - --kinds-c=+p --fields=+S --sort=yes --excmd=number %s 2> %s %s', escaped, null, sort)
endfunction

command! -bang -nargs=* BTags2 call fzf#vim#buffer_tags(<q-args>, plugins#fzf#btag_cmd(), fzf#vim#with_preview({ "placeholder": "{2}:{3..}" }), <bang>0)

nmap <leader>ff :Files<cr>
nmap <leader>fa :Ag<cr>
nmap <leader>fw :Ag <C-R><C-W><CR>
nmap <leader>fb :call fzf#vim#files("", {'options': '-q '.shellescape(expand('<cword>'))})<cr>
nmap <leader>e :Buffers<cr>
nmap <leader>fh :History<cr>
nmap <leader>ti :BTags2<cr>
nmap <leader>tt :Tags<cr>
