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
set wildmenu

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

" view current founded item in Ack results
map <F3> :Ack -i<space>

" switch line numbers on/off
map <F4> :set number!<CR>

" remove last search
map <F6> :let @/ = ""<CR>

" search as you type.
set incsearch

" ignore case when searching.
set ignorecase

" call ctrlp plugin
map <F7> :CtrlP<CR>
map <S-F7> :CtrlPBuffer<CR>

" ctrlP optional files ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" remove vcs's folders
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|jpeg|gif|swf)$',
  \ 'link': 'some_bad_symbolic_links',
  \ 'node': '\v[\/]\.(git|hg|svn)$',
  \ 'images': '\v[\/](images|img)$',
  \ }

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

" List bookmarks: Win-F2 for Linux, Cmd-F2 fir MacOS
if has("gui_gtk2")
  nmap <T-F2> :marks<CR>
else
  nmap <D-F2> :marks<CR>
endif

" recent files list
map <M-F3> :browse oldfiles<CR>

" Custom commands here
" ####################
" format ugly json
command FormatJson execute "%!python -m json.tool"
" Format ugly xml
command FormatXml execute "%!xmllint --format --recover - "


" smart Home key
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

