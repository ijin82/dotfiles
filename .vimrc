" have to be installed pathogen
call pathogen#infect()
call pathogen#helptags()

" highlight on
syntax on

set wildmode=list:longest,full

" backup and swap
set noswapfile
set nobackup
set nowritebackup

" line nubers + rulers
set number
set ruler

" textwrap
set nowrap

" max line length marker
set colorcolumn=120


" disable beeping
set noeb vb t_vb=

" tabs to spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

" tabs navigation
map <C-t> :tabnew<CR>
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

" switch line numbers on/off
map <F4> :set number!<CR>
" Toggle NERDtree
map <F2> :NERDTreeToggle<CR>
" view current founded item in Ack results
nmap <F3> :Ack -i<space>

" Set font for macvim
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas\ 13
  else
    set guifont=Consolas:h16
  endif
endif

" Set colorscheme
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
map <F5> :call ToggleBg()<CR>
function! ToggleBg()
    if &background == 'dark'
        set bg=light
    else
        set bg=dark
    endif
endfunc

" jump to previous position in file on reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
