execute pathogen#infect()
syntax enable
nmap ö :
let mapleader=","
let g:EasyMotion_leader_key = '<Leader>'
set number
set mouse=a
set ignorecase
set noswapfile
set smartcase
set hlsearch
set incsearch
set showmatch
set mat=2
set lazyredraw
set background=dark
set tabstop=4
filetype plugin indent on

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
