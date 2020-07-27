set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Autocomplete
Plugin 'valloric/youcompleteme'
" Color Scheme
Plugin 'jnurmine/Zenburn'
"Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'srcery-colors/srcery-vim'
"GoToDefinition
Plugin 'ludovicchabant/vim-gutentags'
"file tree browsing
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"super search
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
"Commentary
Plugin 'tpope/vim-commentary'
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
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let mapleader = ' '
" Ale Config
let g:ale_linters = {'python': ['flake8', 'palantir-python-language-server'], 'cucumber': ['cucumber'], 'javascript': ['prettier', 'eslint'], 'json': ['jsonlint'], 'dockerfile': ['dockerfile_lint']}
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier', 'eslint'], 'json': ['fixjson']}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_python_flake8_options = '--max-line-length 200 --ignore E501,F403,F405,E252,W605'
let g:ale_python_autopep8_options = '--max-line-length 200 --ignore E501,E252,W605 --aggressive --aggressive --aggressive'
let g:ale_javascript_prettier_options = '--single-quote --tab-width 2 --trailing-comma es5'
let g:ale_fix_on_save = 1
packloadall
call ale#linter#Define('python', {
			\ 'name': 'palantir-python-language-server',
			\'lsp': 'stdio',
			\'executable': '/usr/local/lib/python3.7/site-packages/pyls/python_ls.py',
			\'command': '%e run',
			\'project_root': '/usr/local/lib/python3.7/site-packages/pyls',
			\})
"Rainbow
let g:rainbow_active = 1

"Nerd tree toggle open
noremap <silent><leader>dd :NERDTreeToggle<CR>
"nerdtree open to current opened file
noremap <silent> <Leader>df :NERDTreeFind<CR>
"NerdTree refresh
noremap <silent> <Leader>dr :NERDTreeRefreshRoot<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"nerd tree open by default
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" python highlighting
let python_highlight_all=1
syntax on
" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_num_candidates = 15
"color schemes
set termguicolors
set t_Co=256
let g:gruvbox_contrast_dark = 'hard'
let g:srcery_italic = 0
let g:srcery_inverse_matches = 1
let g:srcery_bold = 1
let g:srcery_inverse = 1

if has('gui_running')
  colorscheme solarized
else
  " colorscheme zenburn
 "colorscheme srcery
 " colorscheme solarized8_low
  colorscheme gruvbox
  set background=dark
endif
autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
"Standard VIM settings
"search highlight
"This unsets the "last search pattern" register by hitting return
set ic
set hls is
set noerrorbells
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
"swap file location
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backupdir//
set undodir=~/.vim/undo//
nnoremap <CR> :noh<CR><CR>
"line numbering
set nu
"utf-8
set encoding=utf-8
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
"maps leader w to open up ripgrep text search
nmap <leader>w :Rg<Cr>
"search for things everything that isn't node_modules or in gitignore
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
nnoremap <silent> <leader>o :All<cr>

"airline settings
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='ouo'
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
noremap <C-d> :sh<CR>
tnoremap <ESC> <C-w>:q!<CR>
"git fugitive
set diffopt+=vertical
noremap <leader>gs :Git<CR>
noremap <leader>gh :diffget //2<CR>
noremap <leader>gl :diffget //3<CR>
noremap <leader>gf :Gdiffsplit!<CR>
"tab mapping
noremap <leader>1 1gt<CR>
noremap <leader>2 2gt<CR>
noremap <leader>3 3gt<CR>
noremap <leader>4 4gt<CR>
noremap <leader>5 5gt<CR>
noremap <leader>6 6gt<CR>
noremap <leader>7 7gt<CR>
noremap <leader>8 8gt<CR>
noremap <leader>9 9gt<CR>
noremap <leader>0 0gt<CR>
noremap <leader>h gT<CR>
noremap <leader>l gt<CR>

"groovy indentation
autocmd Filetype groovy setlocal ts=4 sw=4 expandtab
