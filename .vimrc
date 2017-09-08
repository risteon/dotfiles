"Plugins, load using Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorscheme solarized
Plugin 'altercation/vim-colors-solarized'

" undotree
Plugin 'mbbill/undotree'

" easymotion
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set the runtime path to include Vundle and initialize
filetype plugin indent on       " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Syntax highlighting
syntax enable

nmap ö :
let mapleader=","               " leader is comma
let g:EasyMotion_leader_key = '<Leader>'

set number
set mouse=a
set mousehide
set ignorecase
set noswapfile
set showcmd
set cursorline
set wildmenu                    " visual autocomplete for command menu
set smartcase
set showmatch                   " higlight matching [{()}]

" Searching
set hlsearch                    " highlight matches
set incsearch                   " search as characters are entered 
nnoremap <leader><space> :nohlsearch<CR>    " turn off search highlight

set mat=2
set lazyredraw
set tabstop=2                   " number of visual spaces per tab
set softtabstop=2               " number of spaces in tab when editing
set shiftwidth=2
set expandtab                   " tabs are spaces

" Folding
set nofoldenable                " enable folding
set foldnestmax=15              " 15 nested fold max
set foldmethod=syntax           " fold based on syntax
nnoremap <space> za             " space open/closes folds

" toggle gundo
nnoremap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" Indentation
filetype plugin indent on
filetype plugin on
filetype indent on

" Access system clipboard
set clipboard=unnamed

" Colorscheme SOLARIZED
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" VIM-LATEX
if has('gui_running')
  set grepprg=grep\ -nH\ $*
  filetype indent on
  let g:tex_flavor='latex'
endif

command! -nargs=1 Silent
\   execute 'silent !' . <q-args>
\ | execute 'redraw!'
nnoremap <leader>m :w \| :Silent make slides<CR>

au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

" allows cursor change in tmux mode (vertical bar cursor mode even in tmux)
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Return to last edit position when opening files 
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
let g:airline_powerline_fonts = 1

" Always show statusline
set laststatus=2
