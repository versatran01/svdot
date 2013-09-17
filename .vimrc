execute pathogen#infect()
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
colorscheme desert
set autoindent
set autoread                " reload files when changed on disk
set background=dark
set cmdheight=2             " Height of the command bar
set cursorcolumn
set cursorline              " Highlight current row and column
set encoding=utf8           " Set utf8 as standard encoding
set expandtab               " Use spaces instead of tabs
set hlsearch                " Hightlight search results
set ignorecase              " Ignore case when searching
set incsearch               " Search as you type
set laststatus=2            " Always show the status line
"set list                    " Show trailing whitespace
set lazyredraw
set nobackup
set noswapfile
set nowb
set number                  " Display line numbers
set ruler                   " Show current position
set scrolloff=3             " Show context above/below cursorline
set smarttab                " Be smart when using tabs
set smartcase               " Case insensitive search
set smartindent             " Smart indent 
set showcmd                 
set showmatch               " Show matching brackets
set shiftwidth=4
set tabstop=4
set wildignore=*.o,*~,*.pyc " Ignore compiled files
set wildmenu                " Show a navigable menu for tab completion
set wildmode=longest,list,full
set wrap

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

map <C-n> :NERDTreeToggle<CR>
" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" Use Unix as the standard file type
set ffs=unix,dos,mac
set lbr
set tw=500
