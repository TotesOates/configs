# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/Users/joe.chen/Library/Python/3.8/bin:$PATH
export PATH=/Users/joe.chen/Library/Python:$PATH
export PYTHONPATH=~/dev/automate_me/
export PATH=/Users/joe.chen/Dev/automate_me/lib/python3.8/site-packages:$PATH
export PATH=/Users/joe.chen/Dev/automate_me/lib/python3.7/site-packages:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=/usr/local/lib:$PATH
export ZSH="/Users/joe.chen/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/Users/joe.chen/bin:$PATH"
export PATH="/Users/joe.chen/notify_me:$PATH"
export PATH="/Users/joe.chen:$PATH"
alias lss='ls -a'
alias reload='exec $SHELL'
alias act='source bin/activate'
alias deact='deactivate'
alias api='cd ~/dev/automate_me/nc/api/test_suite/exp_suite'
alias ui='cd ~/dev/automate_me/nc/ui/test_suite/exp_suite'
alias psql96='/usr/local/Cellar/postgresql@9.6/9.6.16/bin/psql'
alias pg_restore96='/usr/local/Cellar/postgresql@9.6/9.6.16/bin/pg_restore'
alias pg_dump96='/usr/local/Cellar/postgresql@9.6/9.6.16/bin/pg_dump'
source $HOME/.aliases
alias k6new='/usr/local/Cellar/k6/0.27/k6-v0.27.0-mac/k6'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="awesomepanda"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="usr/local/Cellar/postgres@9.6/9.6.16/bin:$PATH"
export NVM_DIR="/Users/joe.chen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="~/.npm:$PATH"
export PATH="~/.nvm:$PATH"
export PATH="/usr/local/opt/libpq:$PATH"
export PATH="/usr/local/Cellar/libpq/12.1_1/bin:$PATH"
#export PATH="~/.nvm/versions/node:$PATH"
#
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'
alias vifi='vim $(fzfi)'



ecrtt(){
	tag=${1:-latest}
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 600375142316.dkr.ecr.us-east-1.amazonaws.com
	cd ~/dev/devops/docker/twilio-tester
	container_id=$(docker build --force-rm -t twilio-tester . | grep 'Successfully built' | awk '{print $3}')
	docker tag $container_id 600375142316.dkr.ecr.us-east-1.amazonaws.com/twilio-tester:$tag
	docker push 600375142316.dkr.ecr.us-east-1.amazonaws.com/twilio-tester:$tag
}


# gc "some commit message"
# this will attach the branch name 'AM-1234-stuff' to just add the AM-1234 on the commit message
function gc() {
    BRANCH=`git rev-parse --abbrev-ref HEAD | cut -d- -f1,2`
    git commit -m "$BRANCH $@"
}

export AWS_SDK_LOAD_CONFIG=1
TERM=xterm-color

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
