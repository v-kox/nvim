call plug#begin('~/.vim/autoload/plugged')
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " themes
    Plug 'joshdick/onedark.vim'
    Plug 'kristijanhusak/vim-hybrid-material'
    " Start screen
    Plug 'mhinz/vim-startify'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Git
    Plug 'mhinz/vim-signify'
call plug#end()
