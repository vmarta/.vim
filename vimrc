call plug#begin()

" NOTE - if you install NPM module, also add it to the list in ~/.nvm/default-packages

" TODO: separate between nvim-only plugins and not
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Raimondi/delimitMate'
Plug 'ggandor/leap.nvim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-dirvish'
Plug 'jxnblk/vim-mdx-js'
Plug 'lambdalisue/fern.vim'
Plug 'mhinz/vim-grepper'
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " NOTE: this can run in both vim and neovim
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'projekt0n/github-nvim-theme'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" TODO: separate between nvim-only configurations and not

" Allows project-level .nvimrc files
" https://medium.com/@dnrvs/per-project-settings-in-nvim-fc8c8877d970
set exrc
set secure

set hidden  "allows unsaved buffer to stay in background/hidden
let mapleader = "\<Space>"

set background=light
set termguicolors
colorscheme github_light

" set synmaxcol=500  "avoid hanging on very long lines
set number  "shows line numbers

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
nnoremap K :Grepper -tool rg -highlight -noprompt -query '\b<c-r><c-w>\b'<CR>
" Search across multiple files
nnoremap <Leader>f :Grepper -tool rg -highlight -noprompt -query<Space>

nnoremap <Leader>; :GFiles<cr>
nnoremap <Leader>: :Files<cr>

if !exists('g:vscode')
    "More perl-like
    noremap / /\v
    noremap ? ?\v
endif

if !exists('g:vscode')
    set cursorline  "highlights current line
endif
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

" For more info, see ':help statusline'
set statusline=%m  "whether file has been modified
set statusline+=%f  "shows file path
set statusline+=\ \ %<%{flagship#surround(flagship#filetype())}%w
" Flagship would set the remaining part of the statusline

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
"CSS (and SCSS) options
au FileType css,scss set iskeyword+=-

"----------------------------------
"JavaScript options
au FileType javascript set iskeyword+=-

"----------------------------------
"Konf, tmpl files
au BufNewFile,BufRead *.konf set filetype=javascript
au BufNewFile,BufRead *.include set filetype=javascript
au BufNewFile,BufRead *.tmpl set filetype=dustjs

"----------------------------------
"Fugitive plugin
"auto-clean fugitive buffers
au BufReadPost fugitive://* set bufhidden=delete
nmap gb :Git blame<CR>

"----------------------------------
"Flagship
let g:tabprefix = ""  "no prefix

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
  colorscheme github_light " so that footer is rendered properly
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

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :<C-U>call CocActionAsync('doHover')<CR>

" To fix JavaScript heap out-of-memory (e.g when installing large npm packages)
" let g:coc_node_args = ['--max-old-space-size=8192']

" Use a separate node instance
let g:coc_node_path = '/Users/vmarta/.nvm/versions/node/v16.18.1/bin/node'

" install coc extensions
let g:coc_global_extensions = ['coc-syntax', 'coc-prettier', 'coc-eslint', 'coc-css', 'coc-tsserver', 'coc-json']

" manually trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Workaround for package rebuild causing tsserver to not "see" that package
let g:restart_tsserver = 0

function! RestartTSServer() 
  if g:restart_tsserver == 1
    CocCommand tsserver.restart
    let g:restart_tsserver = 0
  endif 
endfunction

autocmd BufWritePost */pwa-kit/packages/commerce-sdk-react/*,*/pwa-kit/packages/pwa-kit-react-sdk/*,*/pwa-kit/packages/pwa-kit-dev/*,*/pwa-kit/packages/pwa-kit-runtime/* let g:restart_tsserver = 1
autocmd BufEnter */pwa-kit/packages/template-* call timer_start(7000, { -> execute(':call RestartTSServer()')})

"----------------------------------
" coc-css
autocmd FileType scss setl iskeyword+=@-@

"----------------------------------
" FZF
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let g:fzf_history_dir = '~/.local/share/fzf-history'

"----------------------------------
" Fern
nnoremap <leader>e :Fern . -reveal=%<cr>

"----------------------------------
" Grepper
runtime plugin/grepper.vim
" Pass in additional flags to the underlying ripgrep
let g:grepper.rg.grepprg .= ' --smart-case --hidden --glob !.git'

"----------------------------------
" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "jsdoc", "typescript", "tsx", "scss", "html", "fish", "graphql", "lua", "yaml", "json", "jsonc" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = { enable = true },
  indent = { enable = true }
}
EOF

" Code folding with treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Opening a file would no longer closes all folds
autocmd BufReadPost,FileReadPost * normal zR

"----------------------------------
" Leap
lua require('leap').add_default_mappings()
