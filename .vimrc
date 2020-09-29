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
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Color Scheme
" Plugin 'jnurmine/Zenburn'
"Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'srcery-colors/srcery-vim'
"GoToDefinition
Plugin 'ludovicchabant/vim-gutentags'
"file tree browsing
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"super search
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', {'do': { -> fzf#install() }}
"Commentary
Plugin 'tpope/vim-commentary'
"airline
Plugin 'vim-airline/vim-airline'
"ALE syntax and fixer
Plugin 'dense-analysis/ale'
"Bracket coloring
Plugin 'frazrepo/vim-rainbow'
"Auto complete brackets
" Plugin 'jiangmiao/auto-pairs'
Plugin 'tmsvg/pear-tree'


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
" Pear tree options
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
"ALE-COC configs
let g:ale_disable_lsp = 1
" Ale Config
let g:ale_linters = {'python': ['flake8', 'pyls'], 'cucumber': ['cucumber'], 'javascript': ['prettier', 'eslint', 'tsserver'], 'json': ['jsonlint'], 'dockerfile': ['dockerfile_lint']}
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier', 'eslint'], 'json': ['fixjson']}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_python_flake8_options = '--max-line-length 200 --ignore E501,F403,F405,E252,W605'
let g:ale_python_autopep8_options = '--max-line-length 200 --ignore E501,E252,W605 --aggressive --aggressive --aggressive'
let g:ale_javascript_prettier_options = '--single-quote --tab-width 2 --trailing-comma es5'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1
let g:ale_set_balloons = 1
let g:ale_hover_to_preview = 1
" ale completion select with tab or shift tab
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"
noremap <Leader>gd :ALEGoToDefinition<CR>
noremap <Leader>gr :ALEFindReferences<CR>

"COC config
set updatetime=150
set shortmess+=c
set hidden
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"Rainbow
let g:rainbow_active = 1

"Nerd tree toggle open
noremap <silent><Leader>dd :NERDTreeToggle<CR>
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

"color schemes
set termguicolors
set t_Co=256
let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic = 1
" let g:gruvbox_improved_strings = 1
colorscheme gruvbox
set background=dark
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
set relativenumber
"swap file location
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backupdir//
set undodir=~/.vim/undo//
" use mouse scroll
set mouse=r
set ttymouse=xterm2
" on enter to get rid of highlight
nnoremap <CR> :noh<CR><CR>
"line numbering
set nu
"utf-8
set encoding=UTF-8
set rtp+=/usr/local/bin/fzf
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'
nnoremap <leader>f :Files<Cr>
" command! -bang -nargs=? -complete=dir Files
    " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" this layout will turn the search and preview into a full screen tab
let g:fzf_preview_window='right:40%'
let g:fzf_layout = { 'down': '25%' }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -i -U -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
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
"Gitgutter
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

"groovy indentation
autocmd Filetype groovy setlocal ts=4 sw=4 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab
autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
