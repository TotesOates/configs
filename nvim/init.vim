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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
"nvim airline
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
"Auto complete brackets
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Auto indent for all file
Plug 'tpope/vim-sleuth'
" LSP Support 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
" https://github.com/VonHeikemen/lsp-zero.nvim
Plug 'VonHeikemen/lsp-zero.nvim'
"undotree
Plug 'mbbill/undotree'
"tab-merge
Plug 'vim-scripts/Tabmerge'

call plug#end()
let g:python3_host_prog = '/usr/bin/python3'
let mapleader = ' '
luafile ~/.config/nvim/lua/init.lua


nnoremap <leader>du :UndotreeToggle<CR>


nnoremap <leader>gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gD <Cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader><c-k> <Cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>1gD <Cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gr <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>g0 <Cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>gW <Cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <leader>gd <Cmd>lua vim.lsp.buf.declaration()<CR>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Ale Config
let g:ale_disable_lsp = 1
nnoremap <leader>fx :ALEFix<CR>

let g:ale_javascript_prettier_options = '--single-quote --tab-width 4 --trailing-comma es5 --print-width 150'
let g:ale_linters = {'python': ['pyright'], 'cucumber': ['cucumber'], 'javascript': ['prettier', 'eslint', 'tsserver'], 'json': ['jsonlint'], 'dockerfile': ['dockerfile_lint'], 'html': ['prettier'], 'css': ['prettier'], 'terraform': ['checkov'], 'go': ['gopls'] }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black'], 'javascript': ['prettier', 'eslint'], 'html': ['prettier'], 'css': ['prettier'], 'json': ['fixjson'], 'terraform': ['terraform'] }

"Rainbow
let g:rainbow_active = 1

" Nerd tree toggle open
 noremap <silent><Leader>dd :NERDTreeToggle<CR>
" nerdtree open to current opened file
 noremap <silent> <Leader>df :NERDTreeFind<CR>
" NerdTree refresh
 noremap <silent> <Leader>dr :NERDTreeRefreshRoot<CR>


 let NERDTreeQuitOnOpen = 1
 let NERDTreeShowHidden=1
 let NERDTreeMinimalUI = 0
 let NERDTreeDirArrows = 1
 let NERDTreeWinSize = 50

let g:netrw_preview = 1
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
 let g:netrw_keepdir=0
" python highlighting
let python_highlight_all=1

"color schemes
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
colorscheme gruvbox
"Standard VIM settings
syntax enable
set termguicolors
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
set incsearch           "will highlight search while typing out

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
set clipboard+=unnamedplus "Copy paste between vim and everything else
set ruler
set inccommand=nosplit
set guicursor=
set completeopt=menu,menuone,noselect
if !has('nvim')
  set ttymouse=xterm2
endif
" on enter to get rid of highlight
nnoremap <CR> :noh<CR><CR>

" move code down or up a line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
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
