set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'Valloric/YouCompleteMe'
" Syntax
"Plugin 'vim-python/python-syntax'
"Plugin 'vim-syntastic/syntastic'

" Python Style Guide
"Plugin 'nvie/vim-flake8'
"Autoformatter
"Plugin 'psf/black'

" Color Scheme
Plugin 'jnurmine/Zenburn'
"Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'srcery-colors/srcery-vim'
"GoToDefinition
Plugin 'ludovicchabant/vim-gutentags'
"file tree browsing
"Plugin 'scrooloose/nerdtree'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"super search
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
"text search
"Plugin 'jremmen/vim-ripgrep'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

"powerline, install git and current env bar
"Plugin 'powerline/powerline'
"airline
Plugin 'vim-airline/vim-airline'
"ALE syntax and fixer
Plugin 'dense-analysis/ale'
"Bracket coloring
Plugin 'frazrepo/vim-rainbow'
"Auto complete brackets
Plugin 'jiangmiao/auto-pairs'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
" Put your non-Plugin stuff after this line
" Ale Config
let g:ale_linters = {'python': ['flake8'], 'cucumber': ['cucumber']}
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace'] }

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_python_flake8_options = '--max-line-length 200 --ignore E501,F403,F405,E252,W605'
let g:ale_python_autopep8_options = '--max-line-length 200 --ignore E501,E252,W605 --aggressive --aggressive --aggressive'
let g:ale_fix_on_save = 1
"Rainbow
let g:rainbow_active = 1

"Nerd tree toggle open
nmap <F1> :NERDTreeToggle<CR>
"nerdtree open to current opened file
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

"nerd tree open by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"YouCompleteMe Variables
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion = 2
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" python highlighting
let python_highlight_all=1
syntax on
"color schemes
set termguicolors
set t_Co=256
if has('gui_running')
  colorscheme solarized
else
  "colorscheme zenburn
  colorscheme srcery
 "colorscheme solarized8_low
  "colorscheme gruvbox
  set background=dark
endif
let g:srcery_italic = 0
let g:srcery_inverse_matches = 1
let g:srcery_bold = 1
let g:srcery_inverse = 1
"
"let g:gruvbox_contrast_dark = 'hard'

"line numbering
set nu
"utf-8
set encoding=utf-8
"flag whitespace
"au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
""pep8 indentation
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
""html, js, css indentation
"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2

au BufNewFile, BufRead *.feature
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set smartindent
    \ set fileformat=unix
"Standard VIM settings
"search highlight
"This unsets the "last search pattern" register by hitting return
set ic
set hls is
"swap file location
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backupdir//
set undodir=~/.vim/undo//
nnoremap <CR> :noh<CR><CR>
"maps to control + p to open up :FZF fuzzy search
set rtp+=/usr/local/bin/fzf
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'
nnoremap <leader>f :Files<Cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
let g:fzf_layout = {'down': '100%', 'window': '-tabnew'}
"maps to shift + p to open up ripgrep text search
nmap <leader>w :Rg<Cr>
"search for things everything that isn't node_modules or in gitignore
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
nnoremap <silent> <leader>o :All<cr>
"Powerline config
"set laststatus=2
"let g:Powerline_symbols = 'fancy'
"set showtabline=2

"airline settings
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline_theme='<theme>'
" use mouse scroll
set mouse=a
"copy paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" move code down or up a line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"gutentags directory
let g:gutentags_cache_dir='~/.vim/tags'
"let g:gutentags_trace = 1
"guard xtermmouse
if !has('nvim')
    set ttymouse=xterm2
endif
"Switch between terminal and vim, ctrl+d to enter terminal and ctrl+d to
"return to vim
noremap <C-d> :sh<cr>
tnoremap <ESC> <C-w>:q!<CR>
"git fugitive
set diffopt+=vertical
