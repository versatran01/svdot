"execute pathogen#infect('~/.vim/bundle/{}')
"set runtimepath^=~/.vim/bundle/ctrlp.vim
set nocompatible
filetype off

" Key mapping
let mapleader = ','

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Nerdtree
Bundle 'scrooloose/nerdtree'
nmap <leader>d :NERDTree<CR>
nmap <leader>dt :NERDTreeToggle<CR>
nmap <leader>df :NERDTreeFind<CR>

" Alternative
Bundle 'vim-scripts/a.vim'
nmap <leader>a :A<CR>
nmap <leader>as :AS<CR>
nmap <leader>av :AV<CR>

" CtrlP
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-T>'
let g:ctrlp_cmd = 'CtrlP'

" Airline
Bundle 'bling/vim-airline'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Easymotion
" <leader><leader>w,b,e to jump
" <leader><leader>f{char} to search
Bundle 'Lokaltog/vim-easymotion'

" Expand region
" Press + to expand the visual selection and _ to shrink it.
Bundle 'terryma/vim-expand-region'

" Multiple cursors
" Ctrl-n to select, again to search more
" Ctrl-p redo, Ctrl-x skip
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'othree/xml.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/Align'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'majutsushi/tagbar'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
Bundle 'garbas/vim-snipmate'
Bundle 'slim-template/vim-slim'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-endwise'
Bundle 'ervandew/supertab'
Bundle 'tsaleh/vim-matchit'
Bundle 'matze/vim-move'
Bundle 'wincent/Command-T'

syntax on
filetype plugin on
filetype indent on
syntax enable
colorscheme ron

" => General
set autoread                " reload files when changed on disk
set encoding=utf8           " Set utf-8 as standard encoding
set backspace=indent,eol,start
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set history=1000
set hidden
set ttyfast

" => Beautiful
set icon
set background=dark
set cursorcolumn            " Highlight current column
"highlight CursorColumn ctermbg=darkmagenta ctermfg=none
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
"set visualbell

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
"set list
set listchars=tab:▸\ ,trail:▫
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType matlab setlocal expandtab shiftwidth=4 softtabstop=4

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

au BufNewFile,BufRead *.launch setf xml
au BufNewFile,BufRead *.sdf setf xml
au BufNewFile,BufRead *.world setf xml
au BufNewFile,BufRead .bash_aliases setf sh


" Move through wrapped lines
nnoremap  <silent> j gj
nnoremap  <silent> k gk
map  <silent> <home> g<home>
map  <silent> <End>  g<End>

" Move through split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Moving lines
nnoremap <Esc><Down> :m .+1<CR>==
nnoremap <Esc><Up> :m .-2<CR>==
inoremap <Esc><Down> <Esc>:m .+1<CR>==gi
inoremap <Esc><Up> <Esc>:m .-2<CR>==gi
vnoremap <Esc><Down> :m '>+1<CR>gv=gv
vnoremap <Esc><Up> :m '<-2<CR>gv=gv

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

set pastetoggle=<F2>
nmap <silent> ,/ :nohlsearch<CR>

" Enable 256
if $TERM == "xterm-256color"
  set t_Co=256
endif
