export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/nix/var/nix/profiles/default/bin"
export PATH="/opt/homebrew/bin:$PATH"
export HISTFILE=/Users/david/@/log/history
export HISTSIZE=1000000
export SAVEHIST=1000000

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_UPDATE="true"

plugins=(git)
plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

alias nix-shell="nix-shell --run zsh"
alias vi="nvim"
alias v="vim"
alias vim="nvim"
alias @="cd ~/@/"
alias ls="ls --color"

function define() {
  ~/chatgpt "Define $1"
}

function llm() {
  ~/chatgpt "$1"
}

function llmi() {
  chatgpt-cli --model gpt-4o --multiline
}

function c() {
    awk "BEGIN { print $1 }"
}

function gacp() {
    git add .
    git commit -a -m "$1"
    git push
}

eval "$(zoxide init zsh)" || true
eval "$(direnv hook zsh)" || true
