call plug#begin('~/.vim/plugged')
" Initialize plugin system
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
"file tree browsing
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"super search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
"nvim airline
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
"Auto complete brackets
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Auto indent for all file
Plug 'tpope/vim-sleuth'
" .5 neovim
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"undotree
Plug 'mbbill/undotree'

call plug#end()
let g:python3_host_prog = '/usr/bin/python3'
let mapleader = ' '
luafile ~/.config/nvim/lua/init.lua

if exists('g:vscode')
  nnoremap <leader>gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
  nnoremap <leader> gD <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
  nnoremap <leader>f <Cmd> call VSCodeNotify('workbench.action.quickOpen')<CR>
  nnoremap <leader>w <Cmd> call VSCodeNotify('workbench.action.findInFiles')<CR>
  nnoremap <leader>dd <Cmd> call VSCodeNotify('workbench.view.explorer')<CR>
  " tab controls
  nnoremap <leader>1 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
  nnoremap <leader>2 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
  nnoremap <leader>3 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
  nnoremap <leader>4 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
  nnoremap <leader>5 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
  nnoremap <leader>6 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
  nnoremap <leader>7 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
  nnoremap <leader>8 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
  nnoremap <leader>9 <Cmd> call VSCodeNotify('workbench.action.openEditorAtIndex9')<CR>
  nnoremap <leader>l <Cmd> call VSCodeNotify('workbench.action.nextEditor')<CR>
  nnoremap <leader>h <Cmd> call VSCodeNotify('workbench.action.previousEditor')<CR>
endif
if !exists('g:vscode')

nnoremap <leader>du :UndotreeToggle<CR>

"neovim completion
" set completeopt=menuone,noinsert,noselect

nnoremap <leader>gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gD <Cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader><c-k> <Cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>1gD <Cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gr <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>g0 <Cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>gW <Cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <leader>gd <Cmd>lua vim.lsp.buf.declaration()<CR>
"ALE-COC configs
let g:ale_disable_lsp = 0
" Ale Config
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign guibg=red guifg=red
highlight ALEError guibg=red guifg=red
highlight ALEErrorLine guibg=red guifg=red ctermfg=red
highlight ALEWarningSign guibg=red guifg=yellow ctermfg=red
highlight ALEWarning ctermbg=DarkMagenta ctermfg=red
let g:ale_set_signs = 1
let g:ale_set_balloons = 1
let g:ale_set_highlights = 1
let g:ale_fix_on_save = 0
nnoremap <leader>fx :ALEFix<CR>
let g:ale_hover_to_preview = 0
let g:ale_hover_cursor = 1

let g:ale_completion_autoimport = 1
let g:ale_python_flake8_options = '--max-line-length 200 --ignore E501,F403,F405,E252,W605'
let g:ale_python_autopep8_options = '--max-line-length 200 --ignore E501,E252,W605 --aggressive --aggressive --aggressive'
let g:ale_javascript_prettier_options = '--single-quote --tab-width 4 --trailing-comma es5 --print-width 150'
let g:ale_linters = {'python': ['flake8', 'pyls'], 'cucumber': ['cucumber'], 'javascript': ['prettier', 'eslint', 'tsserver'], 'json': ['jsonlint'], 'dockerfile': ['dockerfile_lint'], 'html': ['prettier'], 'css': ['prettier'] }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['autopep8'], 'javascript': ['prettier', 'eslint'], 'html': ['prettier'], 'css': ['prettier'], 'json': ['fixjson'] }

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
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 50

" python highlighting
let python_highlight_all=1

"color schemes
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_warnings = 1
let g:gruvbox_italic = 1
colorscheme gruvbox
"Standard VIM settings
syntax enable
set termguicolors
set t_Co=256 		"Support 256 colors
set background=dark
set ic 			"search highlight
set hls is 		"This unsets the "last search pattern" register by hitting return
set scrolloff=8
set noerrorbells
set smartindent
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set relativenumber 	"line number count relative to where cursor is
set cursorline 		"Different color on the line where cursor is at
set directory=~/.vim/swapfiles/
set backupdir=~/.vim/backupdir/
set mouse=ra  		"use mouse scroll
set nu 			"line numbering
set encoding=UTF-8 	"utf-8"
set updatetime=150 	"faster completion
set shortmess+=c
set hidden		"prevent multiple buffers from opening more buffers
"new setting
" set spell
" set spelllang=en_us
set smarttab		"make tab realize tab counts
set expandtab		"coverts tabs top spaces
set smartindent
set autoindent
set pumheight=10
set cmdheight=2
set iskeyword+=-
set showtabline=2 	"Always show tab bar
set timeoutlen=500	"default timeoutlen is 1000ms
set formatoptions-=cro 	"stop newline continuation of comments
au BufEnter * set fo-=c fo-=r fo-=o
set clipboard=unnamedplus "Copy paste between vim and everything else
set ruler
set inccommand=nosplit
set guicursor=
if !has('nvim')
  set ttymouse=xterm2
endif
" on enter to get rid of highlight
nnoremap <CR> :noh<CR><CR>
" FZF
set rtp+=/usr/local/bin/fzf
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'
nnoremap <leader>f :Files<Cr>
if !has('nvim')
  let g:fzf_preview_window='right:40%'
  let g:fzf_layout = { 'down': '50%' }
endif
if has('nvim')
  let g:fzf_layout = { 'down': '70%' }
  let g:fzf_preview_window='right:50%'
endif

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --glob --no-ignore -C --column --line-number --no-heading --color=always --smart-case -i -U -- %s || true'
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
      \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --smart-case --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
nnoremap <silent> <leader>o :All<cr>


command! -bang -nargs=*  CustomFiles
      \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --smart-case --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
nnoremap <silent> <leader>f :CustomFiles<cr>

" move code down or up a line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"gutentags directory
let g:gutentags_cache_dir='~/.vim/tags'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--fields=+ailmnS', '--tag-relative=yes']
let g:gutentags_ctags_exclude = ['*.git', '*.svg', '*.hg', 'dist', 'build', 'cache', 'bin', 'compiled', 'bundle', 'example', 'vendor', '*.md', '*bundle*.js', '*build*.js', '*.pyc', '*.json', '.*rc', '*.min.*', '.tmp', '*.exe', '*.dll', '*.mp3', '*.ogg', '*.flac', '*.swp', '*.swo', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2', '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx']

" let g:gutentags_trace = 1
if has('nvim')
  tnoremap <leader><ESC> <C-\><C-n><CR>
endif
"git fugitive
set diffopt+=vertical
noremap <leader>gs :Git<CR>
noremap <leader>gh :diffget //2<CR>
noremap <leader>gl :diffget //3<CR>
noremap <leader>gf :Gdiffsplit!<CR>
noremap <leader>gb :Git blame<CR>
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

"reload
noremap <leader>src :source ~/.config/nvim/init.vim<CR>

" Commands for vim-surround
" cs[existing item][new item] , example: cs'[ will change 'thing' to {thing}
" ds[existing] [new item] , example: ds' will change 'thing' to thing
" ysiw[new item], example: ysiw( will change thing to (thing)
" In view mode, S[new item], example: vf0S{} for the word some0 will change to
" {some0}
endif
