
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set nocompatible

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

set number
set autoindent
set history=1000
set tabstop=4
"colorscheme murphy
colorscheme wombat 
"set lines=56 columns=240
set guifont=Monospace\ 8
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab

set incsearch
set showmode
set showmatch
set hlsearch
set ruler
set linespace=0

set encoding=utf-8

set ffs=unix,dos 

"disable toolbar
set guioptions-=T

set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait300-blinkoff150-blinkon300

"folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         
set foldcolumn=4

map <F2> :retab <CR>
"open nerdtree on startup
map <F3> <plug>NERDTreeTabsToggle<CR>
"esc clears search:
"nnoremap <esc> :noh<return><esc>
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><ESC>
"ctags:
"nmap <F8> :TagbarToggle<CR>
"
"disable awful syntax highlighting in drupal modules
"highlight doxygenBrief term=NONE
"highlight drupalOverLength term=NONE
"

"Tagbar
nmap <F8> :TagbarToggle<CR>

"ctrlP for current directory
let g:ctrlp_working_path_mode = 'a'

"Split settings:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>

set splitbelow
set splitright

"End split settings


let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

