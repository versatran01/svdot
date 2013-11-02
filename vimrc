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
filetype plugin on
filetype indent on
syntax enable

" => General
set autoread                " reload files when changed on disk
set encoding=utf8           " Set utf-8 as standard encoding
set backspace=indent,eol,start
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set history=1000
set ttyfast

" => Beautiful
set background=dark
set cursorcolumn            " Highlight current column
highlight CursorColumn ctermbg=darkmagenta ctermfg=none
set cursorline              " Highlight current and column
set number                  " Display line numbers
set ruler                   " Show current position
set cmdheight=2             " Height of the command bar
set laststatus=2            " Always show the status line
set showcmd                 " Show command
set showmode
set showmatch               " Show matching brackets
set scrolloff=3
set sidescrolloff=5
set display+=lastline
set visualbell

" => Indent
set autoindent
set cindent                 " C-style indentation
set smartindent             " Smart indent 
set expandtab               " Use spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set smarttab                " Be smart when using tabs
set tabstop=2
set textwidth=500           " Text wrapping
set wrap
set showbreak=↪\ \          " string to put before wrapped screen lines
set linebreak
set nolist                  " List disables linebreak
set whichwrap+=<,>,[,]      " Make arrow keys wrap lines

" => Search
set hlsearch                " Highlight search results
set smartcase               " Case insensitive search
set ignorecase              " Ignore case when searching
set incsearch               " Search as you type

" => No Swap
set nobackup
set noswapfile              
set nowritebackup           " Prevents automatic write backup before overwriting file

" => Fold
set foldmethod=indent       " fold based on indent
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " dont fold by default

" => Other
set magic                   " For regular expressions turn magic on
set mat=2                   " How many tenths of a second to blink when matching brackets
set nostartofline           " keep cursor in same column for long-range motion cmds
set wildmode=longest,list,full
set wildmenu                " Show a navigable menu for tab completion
set wildignore=*.o,*~,*.pyc " Ignore compiled files
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType matlab setlocal expandtab shiftwidth=4 softtabstop=4

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

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
