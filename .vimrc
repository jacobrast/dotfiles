syntax on
colorscheme apprentice 
"source ~/.vim/cscope_maps.vim

"enable line numbers
set number

"copy/past from stack overflow.... too lazy to reconfigure vimrc after reinstall (9/5/17)

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
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
syntax on               " syntax highlighting
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
