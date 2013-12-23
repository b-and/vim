set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'https://github.com/Valloric/YouCompleteMe'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'git://github.com/klen/python-mode.git'
Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'https://github.com/kien/ctrlp.vim'
Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle 'https://github.com/tpope/vim-fugitive'

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Replace <esc> with jk in insert mode
inoremap <esc> <nop>
inoremap jk <esc>

" , is easier than \
let mapleader=","
let maplocalleader=","

nnoremap ; :

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set pastetoggle=<F2>

set tabstop=8
set shiftwidth=4
set shiftround
set softtabstop=4
set expandtab
set smarttab " Ident by shiftwidth instead of tabstop at start of line

" Auto indent code
set autoindent
set copyindent

" Syntax highlighting on
syntax on

filetype on
filetype indent on
filetype plugin on

" Don't update the display while running macros
set lazyredraw

set number " Show line numbers
set nowrap " Don't wrap long lines
set backspace=indent,eol,start " Make backspace behave as expected

set hlsearch " Highlight search items
set incsearch " Show seach matches as you type
nmap <silent> ,/ :nohlsearch<CR> " Clear search

" Ignore case if search pattern is all lowercase, case sensitive otherwise
set ignorecase
set smartcase

set wildmode=longest,list,full
set wildmenu

" Show powerline bar even if only one window is open
set laststatus=2

" Show whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set history=1000
set undolevels=1000
set nobackup
set noswapfile

" Change SnipMate key to not conflict with YouCompleteMe
imap ss <Plug>snipMateNextOrTrigger

" Uppercase helpers
inoremap <C-u> <esc>viwU
nnoremap <C-u> <esc>viwU

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Ctags
nnoremap <leader>z :!ctags -R .<CR><CR>
nnoremap <silent> <leader>x :TagbarToggle<CR>
nnoremap <leader>t :CtrlPTag<CR>

" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Fugitive
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>f <C-w><C-o>zR " A bug leads to code being folded

" Comment helpers
nnoremap <leader>c I//<esc>
nnoremap <leader>u ^xx
vnoremap <leader>c <esc>:'<,'>normal I//<CR>
vnoremap <leader>u <esc>:'<,'>normal ^xx<CR>

" Python comment helpers
augroup python_comment_helper
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python nnoremap <buffer> <localleader>u ^x
    autocmd FileType python vnoremap <buffer> <localleader>c <esc>:'<,'>normal I#<esc><CR>
    autocmd FileType python vnoremap <buffer> <localleader>u <esc>:'<,'>normal ^x<CR>
augroup END

augroup extra_filetype
    autocmd!
    autocmd BufRead,BufNewFile *.go set filetype=go
    autocmd BufRead,BufNewFile *.rs set filetype=rust
augroup END

" Don't expand tabs in Makefiles
augroup makefile
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

" Remove trailing whitespace when writing
augroup remove_whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

"solarized color settings
set background="dark"
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized

" Load C/C++ headers correctly for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

let g:pymode_rope = 1 " Enable rope in python mode
let g:pymode_folding = 0 " Don't automatically fold python code

let g:pymode_rope_rename_bind = '<leader>rr'
