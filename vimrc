runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

filetype indent plugin on
set hidden  "allows unsaved buffer to stay in background/hidden
let mapleader = "\<Space>"

syntax enable
set background=dark
let g:solarized_menu=0  "turn off the menu that appears on the top menu bar
colorscheme solarized

if has('gui_running')
  set guifont=Consolas:h14
  set guioptions-=T  "hide toolbar
  set number  "shows line numbers
endif

map 0 ^
" Map Y to act like D and C, i.e. to yank until EOL, 
" rather than act as yy (the default)
map Y y$
" Maps for easier scrolling up/down
if has('gui_running')
	map <D-d> <C-d>
	map <D-u> <C-u>
endif

set ignorecase "search is case-insensitive
set smartcase  "search becomes case-sensitive when using capital letters
set incsearch  "search as you type (real time)

" * and # do not advance the cursor and turn on highlight
nnoremap * *:set hlsearch<CR>N
nnoremap # #:set hlsearch<CR>N
"Toggle the search highlight
nnoremap <Leader>s :set hlsearch!<CR>

"More perl-like
noremap / /\v
noremap ? ?\v
"Find/search within the specified files
nnoremap <Leader>f :grep -Eir 
"Search and replace within the current line
"nnoremap <Leader>rl :s/\v/gc<Left><Left><Left>
"Search and replace within the current file
nnoremap <Leader>r :%s/\v/gc<Left><Left><Left>

set cursorline  "highlights current line
set scrolloff=5  "have a min of 5 lines above/below the cursor
set nowrap

set expandtab  "work standard
set tabstop=4  "a tab is shown *like* 4 spaces
set softtabstop=4
set shiftwidth=4  "each step of indenting
au FileType coffee setl tabstop=2
au FileType coffee setl softtabstop=2
au FileType coffee setl shiftwidth=2
au FileType ruby setl tabstop=2
au FileType ruby setl softtabstop=2
au FileType ruby setl shiftwidth=2


set autoread  "if a file changed somewhere else, vim will load this change

set autoindent
set smartindent
"When using p, adjust indent to the current line
nmap p ]p

set laststatus=2  "status line always appears
set showcmd      "show partial command that you're typing
set wildmenu     "better command line completion
if has('gui_running')
	set noruler  "a scroll bar is good enough
else
	set ruler    "show info re: the position of cursor
endif

set visualbell


"quicker escaping from insert to normal mode
inoremap jj <Esc>

"convenience mappings for moving to other windows
noremap <Leader>w <C-w>w
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>h <C-w>h
noremap <Leader>l <C-w>l
noremap <Leader>J <C-w>j<C-w>_
noremap <Leader>K <C-w>k<C-w>_
noremap <Leader>H <C-w>h<C-w>\|
noremap <Leader>L <C-w>l<C-w>\|

"convenience mappings for moving/swapping windows
noremap <Leader>mj <C-w>J
noremap <Leader>mk <C-w>K
noremap <Leader>mh <C-w>H
noremap <Leader>ml <C-w>L

"convenience mappings for resizing windows
noremap <Leader>_ <C-w>_
noremap <Leader>\| <C-w>\|
noremap <Leader>= <C-w>=

"convenience mappings for working with buffers
nnoremap <Leader># :b#<CR>
nnoremap <Leader>b :ls<CR>:buffer<Space>



"----------------------------------
"Session plugin options
let g:session_autoload = "no"
let g:session_autosave = "yes"

"----------------------------------
"CSS (and SCSS) options
au FileType css,scss set iskeyword+=-

"----------------------------------
"jQuery syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"----------------------------------
"Konf files
au BufNewFile,BufRead *.konf set filetype=javascript

"----------------------------------
"Fugitive plugin
"auto-clean fugitive buffers
au BufReadPost fugitive://* set bufhidden=delete
