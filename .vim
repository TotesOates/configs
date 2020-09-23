need to create a .vim directory for vundle to bundle stuff into
Also in the .vim directory, you'll need to create a `undo`, `undodir`, `backupdir`, and `tags` directories. This is because we turned off swap files but still want to keep history of our undos and backups. Tags dir is for ctags and guten-tags to work
**Dependencies for vim** AKA stuff that needs to be installed to work
brew install bat
brew install fzf
brew install ripgrep
brew install black
brew install pgcli
pip3 install autopep8
pip3 install flake8
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
pip3 install python-language-server
npm install -g typescript 
npm install -g fixjson
npm install jsonlint -g
npm install -g dockerfile_lint
https://github.com/romkatv/powerlevel10k
