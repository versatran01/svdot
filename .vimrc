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
set cursorcolumn            " Highlight current column
set cursorline              " Highlight current and column
set encoding=utf8           " Set utf-8 as standard encoding
set expandtab               " Use spaces instead of tabs
set ffs=unix,dos,mac
set hlsearch                " Highlight search results
set ignorecase              " Ignore case when searching
set incsearch               " Search as you type
set laststatus=2            " Always show the status line
"set list                   " Show trailing whitespace
set lazyredraw
set linebreak
set lbr
set magic                   " For regular expressions turn magic on
set mat=2                   " How many tenths of a second to blink when matching brackets
set nobackup
set noswapfile
set nowb
set nolist
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
set whichwrap+=<,>,[,]
set wrap

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

" Key mapping
let mapleader = ','
map <leader>dt :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Move through wrapped lines
map  <silent> <Up>   gk
map  <silent> <Down> gj
map  <silent> <home> g<home>
map  <silent> <End>  g<End>
