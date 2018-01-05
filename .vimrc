set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin surround.vim
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'git://github.com/romainl/Apprentice.git'

" ----------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this linesyntax on

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Set and enable colorscheme
syntax enable
colorscheme apprentice 
"source ~/.vim/cscope_maps.vim

"enable line numbers
set number

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=79       " break lines when line length increased
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set smartindent
set smarttab
set expandtab

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
"syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

"yank/put to system clipboard
set clipboard=unnamedplus

"Blink cursor instead of alarm
set visualbell

"Fix up/down to move editor lines not line numbers
nnoremap j gj
nnoremap k gk

"Remap d to blackhole register
nnoremap d "_d

"No swap files
set noswapfile

"Define a shortcut for commenting
au BufRead,BufNewFile *.py nnoremap # 0i#?<Esc>
au BufRead,BufNewFile *.c nnoremap # 0i//?<Esc>
