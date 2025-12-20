export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.venv/bin:$PATH"
export PATH="/usr/lib:$PATH"
export HISTSIZE=1000000
export SAVEHIST=1000000

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="minimal"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_UPDATE="true"

plugins=(git)
plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

alias vi="nvim"
alias v="nvim"
alias vim="nvim"
alias @="cd ~/@/"
alias copy="pbcopy"
alias paste="pbpaste"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

SESSION_NAMES=("r" "g" "b" "p" "y" "o")

for SESSION in "${SESSION_NAMES[@]}"; do
  if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION"
  fi
done

function sgit() {
    git add .
    git commit -a -m "$1"
    git push
}

function saws() {
  $HOME/@/sh/HmRI0/sync.sh
}

function c() {
  reset && echo -en "\e[3J"
}

function kagi() {
  local search_term="$1"
  curl \
    -H "Authorization: Bot ${KAGI_API_KEY}" \
    -H "Content-Type: application/json" \
    --data "{\"query\": \"${search_term}\"}" \
    https://kagi.com/api/v0/fastgpt | jq '.'
}

function search-nix() {
  local search_term="$1"
  nix run github:peterldowns/nix-search-cli -- "${search_term}"
}

function define() {
  local prefix="Define: "
  local input_string="$1"
  local prefixed_string="$prefix$input_string"

  llm "$prefixed_string"
}

function synonyms() {
  local prefix="List synonyms for word: "
  local input_string="$1"
  local prefixed_string="$prefix$input_string"

  llm "$prefixed_string"
}

function antonyms() {
  local prefix="List antonyms for word: "
  local input_string="$1"
  local prefixed_string="$prefix$input_string"

  llm "$prefixed_string"
}

function musik() {
  local count=${2:-3}
  mpv $(yt-dlp "ytsearch${count}:$1" --get-url -x)
}

function calc() {
  awk "BEGIN { print $1 }"
}
