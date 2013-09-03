" have to be installed pathogen
call pathogen#infect()
call pathogen#helptags()

" highlight on
syntax on

" vim not vi
set nocompatible

" loading the plugin files for specific file types
filetype plugin on

" indent for special file types
filetype indent on

" for airline statusbar
set laststatus=2

" autocomplete settings
set wildmode=list:longest,full

" backup and swap
set noswapfile
set nobackup
set nowritebackup

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" line nubers + ruler
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
set hlsearch

" tabs navigation
map <C-t> :tabnew<CR>
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

" Toggle NERDtree
map <F2> :NERDTreeToggle<CR>

" view current founded item in Ack results
map <F3> :Ack -i<space>

" switch line numbers on/off
map <F4> :set number!<CR>

" switch hlsearch
map <F6> :set hlsearch!<CR>

" find forler for current file in NERDTree
map ff :NERDTreeFind<CR>


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
  colorscheme solarized
else
  set background=dark
endif

" Toggle background
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

" For SnipMate
autocmd FileType python set ft=python.django

" For SnipMate
autocmd FileType html set ft=htmldjango.html

" fullscreen *hack* on open
if has('gui_running')
  set lines=999
  set columns=999
endif


" select text: shift + arrow = visual mode
if has('gui_running')
  nmap <S-Right> v<Right>
  nmap <S-Left> v<Left>
  nmap <S-Down> V<Down>
  nmap <S-Up> V<Up>
  
  " remove long jumps with shift in visual mode  
  vmap <S-Right> <Right>
  vmap <S-Left> <Left>
  vmap <S-Down> <Down>
  vmap <S-Up> <Up>

  " select line to end 
  nmap <S-End> v$
  " select line to begin
  nmap <S-Home> v0
endif

" List bookmarks: Win-F2 for Linux, Cmd-F2 fir MacOS
if has("gui_gtk2")
  nmap <T-F2> :marks<CR>
else
  nmap <D-F2> :marks<CR>
endif

" Custom commands here
" ####################
" format ugly json
command FormatJson execute "%!python -m json.tool"

