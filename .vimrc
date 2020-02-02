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
Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline-themes'

"GoToDefinition
Plugin 'ludovicchabant/vim-gutentags'
"file tree browsing
Plugin 'scrooloose/nerdtree'
"super search
Plugin 'junegunn/fzf'
"text search
Plugin 'jremmen/vim-ripgrep'

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
let g:ale_python_flake8_options = '--max-line-length 200 --ignore E501,F403,F405'
let g:ale_python_autopep8_options = '--max-line-length 200 --ignore E501 --aggressive --aggressive --aggressive'
let g:ale_fix_on_save = 1
"Rainbow
let g:rainbow_active = 1

"Nerd tree toggle open
nmap <F1> :NERDTreeToggle<CR>

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"YouCompleteMe Variables
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion = 2
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" python highlighting
let python_highlight_all=1
syntax on
"color schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  "colorscheme zenburn
  "colorscheme solarized8_high
  colorscheme gruvbox
endif
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
nmap <C-P> :FZF<CR>
"maps to shift + p to open up ripgrep text search
nmap <S-P> :Rg
"ripgrep smart search case sensitivity
let g:rg_command = 'rg --vimgrep -S'
let g:rg_highlight = 'true'
"Powerline config
"set laststatus=2
"let g:Powerline_symbols = 'fancy'
"set showtabline=2

"airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline_theme='<theme>'
" use mouse scroll
set mouse=a
" move code down or up a line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"gutentags directory
let g:gutentags_cache_dir='~/.vim/tags'
