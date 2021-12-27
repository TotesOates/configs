// make this into a makefile

// install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

// create ./config/nvim/init.vim
mkdir ./config/nvim
touch ./init.vim

//create lua config in ./.config/nvim
mkdir ./lua
touch ./lua/init.lua

//add all the configs files in .config/nvim/lua into the newly created directory

// install neovim
brew install --HEAD luajit
brew install --HEAD neovim

// install all plugins
open nvim, run :PlugInstall

// install treesitter languages
:TSInstall <language>
// install language servers
