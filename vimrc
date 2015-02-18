filetype off  " It'll be turned on later

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'cakebaker/scss-syntax.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jimmyhchan/dustjs.vim'
Bundle 'jpalardy/vim-slime'
Bundle 'justinmk/vim-sneak'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
" Bundle 'marijnh/tern_for_vim'
Bundle 'matchit.zip'
Bundle 'othree/html5-syntax.vim'
" Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'rking/ag.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'walm/jshint.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"



set hidden  "allows unsaved buffer to stay in background/hidden
let mapleader = "\<Space>"

syntax enable
set background=dark
" let g:solarized_menu=0  "turn off the menu that appears on the top menu bar
colorscheme solarized

if has('gui_running')
  set guifont=Source\ Code\ Pro:h15
  set guioptions-=T  "hide toolbar
  set number  "shows line numbers
endif

map 0 ^
" Map Y to act like D and C, i.e. to yank until EOL, 
" rather than act as yy (the default)
map Y y$
" Maps for easier scrolling up/down
" if has('gui_running')
" 	map <D-d> <C-d>
" 	map <D-u> <C-u>
" endif

set ignorecase "search is case-insensitive
set smartcase  "search becomes case-sensitive when using capital letters
set incsearch  "search as you type (real time)

" * and # do not advance the cursor and turn on highlight
nnoremap * *:set hlsearch<CR>N
nnoremap # #:set hlsearch<CR>N
"Toggle the search highlight
nnoremap <Leader>s :set hlsearch!<CR>

" Grep word under cursor
nnoremap K :Ag! -w <C-R><C-W><CR>
" Search across multiple files
nnoremap <Leader>f :Ag! -S 

"More perl-like
noremap / /\v
noremap ? ?\v
"Find/search within the specified files
" nnoremap <Leader>f :Ggrep -Ei 
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
" nmap p ]p

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
"JavaScript options
au FileType javascript set iskeyword+=-

"----------------------------------
"JavaScript libraries syntax
let g:used_javascript_libs = 'jquery'

"----------------------------------
"Konf, tmpl files
au BufNewFile,BufRead *.konf set filetype=javascript
au BufNewFile,BufRead *.include set filetype=javascript
au BufNewFile,BufRead *.tmpl set filetype=dustjs

"----------------------------------
"Fugitive plugin
"auto-clean fugitive buffers
au BufReadPost fugitive://* set bufhidden=delete

"----------------------------------
"TComment plugin
"set a different shortcut to avoid conflict with my mappings
let g:tcommentMapLeader2 = "<Leader>/"

"----------------------------------
"SuperTab plugin
"smart completion based on the text preceding the cursor
let g:SuperTabDefaultCompletionType = "context"

"----------------------------------
"CtrlP plugin
"ignore these files/directories
set wildignore+=*.so,*.swp,*.swo

if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"----------------------------------
"YouCompleteMe plugin
let g:ycm_filetype_blacklist = {'notes': 1, 'markdown': 1, 'text': 1, 'fugitiveblame': 1}
let g:ycm_min_num_of_chars_for_completion = 3

let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" let g:ycm_cache_omnifunc = 0
" let g:ycm_add_preview_to_completeopt = 0
" set completeopt-=preview
let g:ycm_autoclose_preview_window_after_insertion = 1

"----------------------------------
"Sneak plugin
" let g:sneak#streak = 1
let g:sneak#use_ic_scs = 1
" map f to use Sneak
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
" xmap f <Plug>Sneak_s
" xmap F <Plug>Sneak_S
" omap f <Plug>Sneak_s
" omap F <Plug>Sneak_S

