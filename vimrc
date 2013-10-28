execute pathogen#infect('~/.vim/bundle/{}')
set runtimepath^=~/.vim/bundle/ctrlp.vim
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-commentary'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'honza/vim-snippets'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'slim-template/vim-slim'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/a.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-endwise'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'tsaleh/vim-matchit'
"Bundle "taketwo/vim-ros"
syntax on

" => General
set history=700

filetype plugin on
filetype indent on
syntax enable
set autoindent
set autoread                " reload files when changed on disk
set background=dark
set backspace=indent,eol,start
set cmdheight=2             " Height of the command bar
set cindent                 " C-style indentation
set clipboard=unnamedplus
"set colorcolumn=85
"highlight ColorColumn ctermbg=darkgray
set cursorcolumn            " Highlight current column
highlight CursorColumn ctermbg=darkmagenta ctermfg=none
set cursorline              " Highlight current and column
"highlight CursorLine ctermbg=darkmagenta ctermfg=none
set encoding=utf8           " Set utf-8 as standard encoding
set expandtab               " Use spaces instead of tabs
set fileformats=unix,dos,mac
set hlsearch                " Highlight search results
set ignorecase              " Ignore case when searching
set incsearch               " Search as you type
set laststatus=2            " Always show the status line
"set list                   " Show trailing whitespace
set lazyredraw
set linebreak
set magic                   " For regular expressions turn magic on
set mat=2                   " How many tenths of a second to blink when matching brackets
set nobackup
set noswapfile              
set nowritebackup           " Prevents automatic write backup before overwriting file
set nolist                  " List disables linebreak
set number                  " Display line numbers
set ruler                   " Show current position
set smarttab                " Be smart when using tabs
set smartcase               " Case insensitive search
set smartindent             " Smart indent 
set showcmd                 
set showmatch               " Show matching brackets
set shiftwidth=2
set softtabstop=2
" set spell
set tabstop=2
set textwidth=500           " Text wrapping
set ttyfast
set wildignore=*.o,*~,*.pyc " Ignore compiled files
set wildmenu                " Show a navigable menu for tab completion
set wildmode=longest,list,full
set whichwrap+=<,>,[,]      " Make arrow keys wrap lines
set wrap

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType matlab setlocal expandtab shiftwidth=4 softtabstop=4
if !&scrolloff
  set scrolloff=3
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

" Fix Cursor in TMUX
"if exists('$TMUX')
  "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
  "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

au BufNewFile,BufRead *.launch setf xml
au BufNewFile,BufRead .bash_aliases setf sh

" Key mapping
let mapleader = ','
nmap <leader>d :NERDTree<CR>
nmap <leader>dt :NERDTreeToggle<CR>
nmap <leader>df :NERDTreeFind<CR>
nmap <leader>tb :TagbarToggle<CR>
nmap <leader>a :A<CR>
nmap <leader>as :AS<CR>
nmap <leader>av :AV<CR>

" Move through wrapped lines
map  <silent> <Up>   gk
map  <silent> <Down> gj
map  <silent> <home> g<home>
map  <silent> <End>  g<End>
