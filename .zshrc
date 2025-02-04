export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/bin:$PATH"
export PATH="~/.venv/bin:$PATH"
export PATH="/usr/lib:$PATH"
export HISTFILE=~/@/log/history
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

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"








function llm() {
   if [ $# -ne 1 ]; then
       echo "Usage: llm <string>"
       return 1
   fi

   local input_string="$1"

   echo "$input_string" | ~/.venv/bin/chatgpt-cli --non-interactive
}

function llmi() {
  ~/.venv/bin/chatgpt-cli --multiline
}





# ╔═════════════════════════════════════════════════════════╗
# ║                         K1                              ║
# ╚═════════════════════════════════════════════════════════╝

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

function explain() {
  local prefix="Explain: "
  local input_string="$1"
  local prefixed_string="$prefix$input_string"

  llm "$prefixed_string"
}

function cheat() {
  local prefix="For the following request (1) do not provide introductions, conclusions, disclaimers or warnings (2) minimize comments (3) be as information dense as possible. Provide a cheatsheet / API summary for: "
  local input_string="$1"
  local prefixed_string="$prefix$input_string"

  llm "$prefixed_string"
}

function recommend() {
  local prefix="Your task is to recommend content similar to how youtube will recommend content in the sidebar. Your recommendations may be loosely or tightly connected to the current content. Do not provide introduction or conclusions. For the recommended content, only provide title without description in a list format. The current content is: "
  local input_string="$1"
  local prefixed_string="$prefix$input_string"

  llm "$prefixed_string"
}

# ╔═════════════════════════════════════════════════════════╗
# ║                         K2                              ║
# ╚═════════════════════════════════════════════════════════╝

function wiki() {
  ~/@/sh/wiki.sh $1
}

# ╔═════════════════════════════════════════════════════════╗
# ║                         K3                              ║
# ╚═════════════════════════════════════════════════════════╝

function doi() {
  curl -s "https://api.crossref.org/works?query=$1&rows=20" | jq '.message.items[] | {title: .title[0], DOI: .DOI}'
}

function paper() {
  ~/@/sh/paper.sh $1
}

# ╔═════════════════════════════════════════════════════════╗
# ║                         K4                              ║
# ╚═════════════════════════════════════════════════════════╝















function m() {
  local m_history="/Users/david/@/log/m"

  if ! grep -Fxq "$1" "$m_history"; then
    echo $1 >> "$m_history"
  fi

  local count=${2:-3}
  mpv $(yt-dlp "ytsearch${count}:$1" --get-url -f 140)
}

function mr() {
  recommend $1 &
  m $1 $2
}

function ms() {
  local file="/Users/david/@/log/m"

  local lines=()
  while IFS= read -r line; do
    lines+=("$line")
  done < "$file"

  local num_lines=${#lines[@]}

  while true; do
    local random_index=$((RANDOM % num_lines))
    local random_line="${lines[random_index]}"

    echo "search term: $random_line"
    m $random_line $1
  done
}

function c() {
    awk "BEGIN { print $1 }"
}

function gacp() {
    git add .
    git commit -a -m "$1"
    git push
}





SESSION_NAMES=("r" "g" "b" "p" "y")

for SESSION in "${SESSION_NAMES[@]}"; do
  if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION"
  fi
done









