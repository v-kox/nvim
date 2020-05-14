set nocompatible
" Enable syntax highlighting
syntax enable

" Necessary for multiple buffers
set hidden

" Set line number relative to current line
set number relativenumber

" Show tab characters and trailing whitespace
set listchars=tab:>-,trail:-
set list

" Hightlight current line
set cursorline

" Highligh position of cursor
set ruler

" Set number of spaces for TAB
set tabstop=4
set shiftwidth=4
set smarttab

" TAB expanded to space
set expandtab

" Highlight matching braces
set showmatch

" Auto indent
set autoindent

" Dont wrap long lines
set nowrap

" Horizontal split will be below, vertical split will be right
set splitbelow
set splitright

set laststatus=2
set showtabline=2

set t_Co=256 " enable 256 colours

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
