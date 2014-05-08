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

filetype plugin on
if has('gui_running')
  set grepprg=grep\ -nH\ $*
    filetype indent on
  let g:tex_flavor='latex'
endif

filetype plugin on
filetype indent on
au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
let g:airline_powerline_fonts = 1

" Always show statusline
set laststatus=2
