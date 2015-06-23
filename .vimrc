" have to be installed pathogen
call pathogen#infect('bundle/{}')
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
set wildmenu

" backup and swap
set noswapfile
set nobackup
set nowritebackup

set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar

" line nubers + ruler
set number
set ruler

" textwrap
set nowrap

" max line length marker
set colorcolumn=120

" disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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

" find forler for current file in NERDTree
map ff :NERDTreeFind<CR>

" insert current date 
nnoremap <F9> "=strftime("%d %b %Y")<CR>P
inoremap <F9> <C-R>=strftime("%d %b %Y")<CR>

" switch line numbers on/off
map <F4> :set number!<CR>

" remove last search
map <F6> :let @/ = ""<CR>

" search as you type.
set incsearch

" ignore case when searching.
set ignorecase

" Set font for macvim
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas\ 13
    set columns=158
    set lines=46
  else
    set guifont=Consolas:h16
  endif
  map <C-Tab> :tabn<CR>
endif

" Set colorscheme
set background=light
if has('gui_running')
  colorscheme solarized
else
  colorscheme monokai
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

" fullscreen *hack* on open
"if has('gui_running')
"  set lines=999
"  set columns=999
"endif

" select text: shift + arrow = visual mode
if has('gui_running')
  nmap <S-Right> v<Right>
  nmap <S-Left> v<Left>
  nmap <S-Down> V
  nmap <S-Up> V
  
  " remove long jumps with shift in visual mode
  vmap <S-Right> <Right>
  vmap <S-Left> <Left>
  vmap <S-Down> <Down>
  vmap <S-Up> <Up>

  " select line to end 
  nmap <S-End> v$
  " select line to begin
  nmap <S-Home> v0

  " selection in insert mode
  imap <S-Down> <Esc>V
  imap <S-Up> <Esc>V
  imap <S-Left> <Esc><Left>v<Left>
  imap <S-Right> <Esc><Right>v<Right>
  imap <S-End> <Esc><Right>v$
  imap <S-Home> <Esc><Left>v0
end

" recent files list
nmap <F3> :browse oldfiles<CR>

" Custom commands here
" ####################
" format ugly json
command! FmtJson execute "%!python -m json.tool"
" Format ugly xml || sudo apt-get install libxml2-utils
command! FmtXml execute "%!xmllint --format --recover - "

" smart Home key
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" edit ~/.vimrc file on :rcedit
command! RcEdit e $MYVIMRC
" reload ~/.vimrc config
command! RcReload source $MYVIMRC

" fix PageUp & PageDown
map <PageDown> <Home><C-d>
map <PageUp> <Home><C-u>

" backspace
set backspace=indent,eol,start

" new mapleader
let mapleader=","

