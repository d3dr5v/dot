export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:/nix/var/nix/profiles/default/bin"
export PATH="/opt/homebrew/bin:$PATH"


ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_UPDATE="true"

plugins=(git)
plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

export HISTFILE=/Users/.david/log/history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

alias vi="nvim"
alias v="vim"
alias vim="nvim"


function define() {
  ~/chatgpt "Define $1"
}

function c() {
    awk "BEGIN { print $1 }"
}

eval "$(zoxide init zsh)"
