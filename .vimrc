"Plugins, load from .vim/bundle
call pathogen#infect()          " use pathogen
call pathogen#incubate()        " use pathogen

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
set tabstop=4                   " number of visual spaces per tab
set softtabstop=4               " number of spaces in tab when editing
set expandtab                   " tabs are spaces

" Folding
set nofoldenable                " enable folding
set foldnestmax=15              " 15 nested fold max
set foldmethod=syntax           " fold based on syntax
nnoremap <space> za             " space open/closes folds

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Indentation
filetype plugin indent on
filetype plugin on
filetype indent on

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
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:airline_powerline_fonts = 1

" Always show statusline
set laststatus=2
