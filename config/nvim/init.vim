" BASIC SETUP and VUNDLE PLUGINS
"
set nocompatible               " be improved, required
filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ===================
" my plugins here
" ===================

" Plugin 'dracula/vim'


" ===================
" end of plugins
" ===================
call vundle#end()               " required
filetype plugin indent on       " required

"" enter the current millenium
"set nocompatible
"
"" Plugins, load using Vundle
"filetype off                  " required
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"
"" colorscheme solarized
"Plugin 'altercation/vim-colors-solarized'
"
"" undotree
"Plugin 'mbbill/undotree'
"
"" easymotion
"Plugin 'easymotion/vim-easymotion'
"
"" YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'
"
"" NerdTree
"Plugin 'scrooloose/nerdtree'
"" These two open NERDTree on start if no file specified on launch
"autocmd StdinReadPre * let s:std_in=1 
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" Toggle NERDTree on and off
"nnoremap <C-n> :NERDTreeToggle <CR> 
"
""
"Bundle 'LucHermitte/lh-vim-lib'
"
"" Rust file detection, syntax highlighting, formatting
"Plugin 'rust-lang/rust.vim'
"
"
"" All of your Plugins must be added before the following line
"call vundle#end()
"
"" Enable syntax and plugins
"syntax enable
"filetype plugin indent on
"
"" Set utf8 as standard encoding 
"set encoding=utf-8
"
"" Make backups
"set backup
"set writebackup
"set backupdir=~/.vimbackup
"set directory=~/.vimtmp
"
"" Use comma as leader
"let mapleader=","
"let g:EasyMotion_leader_key = '<Leader>'
"
"" Mapping for spell check. Auto-enable for .txt and .md
"nnoremap <Leader>sp :setlocal spell spelllang=en_us<CR> 
"nnoremap <Leader>nsp :set nospell<CR>
"au BufRead *.txt,*.md setlocal spell
"
"" Configure searching
"set hlsearch                                " highlight matches
"set incsearch                               " search as characters are entered 
"nnoremap <leader><space> :nohlsearch<CR>    " turn off search highlight
"
"" Always show statusline
"set laststatus=2
"
"" timeout configuration for instantenous esc
"set timeoutlen=1000 ttimeoutlen=0
"
"" Configure YouCompleteMe
"" enable YCM for cpp and python filetype
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'python': 1 }
"" control identifier-based completion
"let g:ycm_min_num_of_chars_for_completion = 4
"" semantic information: GetType
"nnoremap <leader>gt :YcmCompleter GetType<CR>
"" semantic goto
"nnoremap <leader>fs :YcmCompleter GoTo<CR>
"" semantic configuration: FixIt
"nnoremap <leader>fi :YcmCompleter FixIt<CR>
"
"" Set linewrap for C++ files
"augroup WrapLineInCppFile
"    autocmd!
"    autocmd FileType cpp setlocal wrap
"augroup END
"
""""""""""""
"
"set number
"set mouse=a
"set mousehide
"set ignorecase
"set noswapfile
"set showcmd
"set cursorline
"set wildmenu                    " visual autocomplete for command menu
"set smartcase
"set showmatch                   " higlight matching [{()}]
"
"
"set mat=2
"set lazyredraw
"set tabstop=2                   " number of visual spaces per tab
"set softtabstop=2               " number of spaces in tab when editing
"set shiftwidth=2
"set expandtab                   " tabs are spaces
"
"" Folding
"set nofoldenable                " enable folding
"set foldnestmax=15              " 15 nested fold max
"set foldmethod=syntax           " fold based on syntax
"nnoremap <space> za             " space open/closes folds
"
"" toggle gundo
"nnoremap <leader>u :UndotreeToggle<CR>
"if has("persistent_undo")
"  set undodir=~/.undodir/
"  set undofile
"endif
"
"" Access system clipboard
"set clipboard=unnamed
"
"" Colorscheme SOLARIZED
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"
"" VIM-LATEX
"if has('gui_running')
"  set grepprg=grep\ -nH\ $*
"  filetype indent on
"  let g:tex_flavor='latex'
"endif
"
"command! -nargs=1 Silent
"\   execute 'silent !' . <q-args>
"\ | execute 'redraw!'
"nnoremap <leader>m :w \| :Silent make slides<CR>
"
"au BufEnter *.tex set autowrite
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
"let g:Tex_GotoError = 0
"let g:Tex_ViewRule_pdf = 'evince'
"
"" allows cursor change in tmux mode (vertical bar cursor mode even in tmux)
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
"
"" Return to last edit position when opening files 
"autocmd BufReadPost *
"	\ if line("'\"") > 0 && line("'\"") <= line("$") |
"	\ exe "normal! g`\"" |
"	\ endif
"
"" insert log entry
":nnoremap <F5> "=strftime("---\n\n%H:%M:%S")<CR>P
":inoremap <F5> <C-R>=strftime("---\n\n%H:%M:%S")<CR>
"
"" POWERLINE SETUP
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"let g:airline_powerline_fonts = 1
"
