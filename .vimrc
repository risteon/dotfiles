"Plugins, load from .vim/bundle
execute pathogen#infect()

" Syntax highlighting
syntax enable

nmap ö :
let mapleader=","
let g:EasyMotion_leader_key = '<Leader>'

set number
set mouse=a
set mousehide
set ignorecase
set noswapfile
set smartcase
set hlsearch
set incsearch
set showmatch
set mat=2
set lazyredraw
set tabstop=4

"colorscheme wombat256mod
"let g:kolor_alternative_matchparen=1
"colorscheme kolor
"hi Normal ctermbg=NONE
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

if has('gui_running')
  set grepprg=grep\ -nH\ $*
    filetype indent on
  let g:tex_flavor='latex'
endif

filetype plugin indent on
filetype plugin on
filetype indent on


au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'


" CLANG_COMPLETE
let g:clang_library_path='/usr/lib/llvm-3.5/lib'
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_snippets=1
let g:clang_snippets_engine='ultisnips'
let g:clang_conceal_snippets=1

set completeopt=longest,menuone


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:airline_powerline_fonts = 1

" Always show statusline
set laststatus=2
