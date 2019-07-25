call plug#begin()

" NOTE - if you install NPM module, also add it to the list in ~/.nvm/default-packages

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Raimondi/delimitMate'
Plug 'aliva/vim-fish'
Plug 'altercation/vim-colors-solarized'
Plug 'csscomb/vim-csscomb'
Plug 'editorconfig/editorconfig-vim'
Plug 'jimmyhchan/dustjs.vim'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-sneak'
Plug 'kchmck/vim-coffee-script'
" Plug 'kien/ctrlp.vim'
" Plug 'matchit.zip'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'rking/ag.vim'
Plug 'sotte/presenting.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'walm/jshint.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'HerringtonDarkholme/yats.vim'

call plug#end()



" Allows project-level .nvimrc files
" https://medium.com/@dnrvs/per-project-settings-in-nvim-fc8c8877d970
set exrc
set secure

set hidden  "allows unsaved buffer to stay in background/hidden
let mapleader = "\<Space>"

au VimEnter * syntax enable
set background=light
" let g:solarized_menu=0  "turn off the menu that appears on the top menu bar
colorscheme solarized

set synmaxcol=256  "avoid hanging on very long lines

if has('gui_running')
  set guifont=Source\ Code\ Pro:h15
  set guioptions-=T  "hide toolbar
  set number  "shows line numbers
endif

if has('nvim')
  set number  "shows line numbers

  " tnoremap <Esc> <C-\><C-n>
  " tnoremap <C-v><Esc> <Esc>
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

" copy and paste
vmap <Leader>c "+y
nmap <Leader>p "+p
vmap <Leader>p c<ESC>"+p

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
nnoremap <Leader>f :Ag!<Space>

nnoremap <c-p> :GFiles<cr>

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

" set expandtab  "work standard
" set tabstop=4  "a tab is shown *like* 4 spaces
" set softtabstop=4
" set shiftwidth=4  "each step of indenting
" au FileType coffee setl tabstop=2
" au FileType coffee setl softtabstop=2
" au FileType coffee setl shiftwidth=2
" au FileType ruby setl tabstop=2
" au FileType ruby setl softtabstop=2
" au FileType ruby setl shiftwidth=2


set autoread  "if a file changed somewhere else, vim will load this change
if !has('gui_running')
  au CursorHold,BufEnter * checktime
endif

set autoindent
set smartindent
"When using p, adjust indent to the current line
" nmap p ]p

set laststatus=2  "status line always appears
set showtabline=2 "tabline always appears

set statusline=%f  "shows file path
set statusline+=\ %m  "whether file has been modified
set statusline+=%=  "from now on, right align the text
set statusline+=%y  "file type (e.g. javascript, dustjs)

set showcmd      "show partial command that you're typing
set wildmenu     "better command line completion

set visualbell

"quicker escaping from insert to normal mode
inoremap jk <Esc>

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
" noremap <Leader>mj <C-w>J
" noremap <Leader>mk <C-w>K
" noremap <Leader>mh <C-w>H
" noremap <Leader>ml <C-w>L

"convenience mappings for resizing windows
noremap <Leader>_ <C-w>_
noremap <Leader>\| <C-w>\|
noremap <Leader>= <C-w>=

"convenience mappings for working with buffers
nnoremap <Leader># :b#<CR>
" nnoremap <Leader>b :ls<CR>:buffer<Space>
nnoremap <Leader>b :Buffers<CR>



"----------------------------------
"Session plugin options
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_persist_colors = 0
"forget about hidden buffers
set sessionoptions-=buffers

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
let g:tcomment_mapleader2 = "<Leader>/"

"----------------------------------
"SuperTab plugin
"smart completion based on the text preceding the cursor
let g:SuperTabDefaultCompletionType = "context"

"----------------------------------
"CtrlP plugin
"ignore these files/directories
"TODO: replace CtrlP with FZF (and port the following options)
"nnoremap <c-p> :FZF<cr>
set wildignore+=*.so,*.swp,*.swo

if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_root_markers = ['.ctrlp']

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

"----------------------------------
"Projectionist plugin
let g:projectionist_heuristics = {
    \ "adaptation/&assets/js/ui/": {
    \     "adaptation/views/*.js": {
    \          "type": "view"
    \     },
    \     "adaptation/views/parsers/*.js": {
    \         "type": "parser"
    \     },
    \     "adaptation/views/decorators/*.js": {
    \         "type": "decorator"
    \     },
    \     "assets/js/ui/view-scripts/*.js": {
    \         "type": "ui"
    \     },
    \     "adaptation/templates/*.dust": {
    \         "type": "template"
    \     },
    \     "adaptation/templates/partials/*.dust": {
    \         "type": "partial"
    \     }
    \ }}

"----------------------------------
"Neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"----------------------------------
"vim-jsx
"Allows highlighting of jsx code in regular .js files
let g:jsx_ext_required = 0

"----------------------------------
"Flagship
let g:tabprefix = ""
let g:tablabel = "%N%{flagship#tabmodified()} %<%f%q"

"----------------------------------
"Goyo
function! s:goyo_enter()
  set wrap
  set linebreak
  set list
endfunction

function! s:goyo_leave()
  set nowrap
  set nolinebreak
  set nolist
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"----------------------------------
"Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
nnoremap <Leader>m :Goyo<cr>

"----------------------------------
" COC intellisense engine
nmap <silent> <leader>g <Plug>(coc-definition)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"----------------------------------
" FZF
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let g:fzf_history_dir = '~/.local/share/fzf-history'
