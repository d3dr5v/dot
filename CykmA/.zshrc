export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/bin:$PATH"
export PATH="~/.venv/bin:$PATH"
export PATH="/usr/lib:$PATH"
export NODE_PATH=/Users/david/.js/node_modules
export HISTFILE=~/.@/dot/hu3g0/.zsh_history
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

function word() {
  llm "Make up a fake word. Only provide the word and nothing else"
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















function musik() {
  local count=${2:-3}
  mpv $(yt-dlp "ytsearch${count}:$1" --get-url -f 140)
}

function musikr() {
  recommend $1 &
  musik $1 $2
}




function c() {
    awk "BEGIN { print $1 }"
}




function scg() {
    git add .
    git commit -a -m "$1"
    git push
}

function sc-public() {
  local prefix="david-roussov-public-"
  local current_dir
  current_dir=$(basename "$PWD")

  local bucket_name="s3://${prefix}${current_dir}"

  AWS_PROFILE=davidroussov aws s3 sync . "$bucket_name"
}

function sc-private() {
  local prefix="david-roussov-private-"
  local current_dir
  current_dir=$(basename "$PWD")

  local bucket_name="s3://${prefix}${current_dir}"

  AWS_PROFILE=davidroussov aws s3 sync . "$bucket_name"
}




function search() {
  local search_term="$1"
  curl \
    -H "Authorization: Bot ${KAGI_API_KEY}" \
    -H "Content-Type: application/json" \
    --data "{\"query\": \"${search_term}\"}" \
    https://kagi.com/api/v0/fastgpt
}





SESSION_NAMES=("r" "g" "b" "p" "y")

for SESSION in "${SESSION_NAMES[@]}"; do
  if ! tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux new-session -d -s "$SESSION"
  fi
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


export PATH="$PATH:/Users/david/.gem/ruby/3.3.0/bin"
export PATH="/nix/store//zz1nlk2mswx825rgah04xw93dv29mya7-ruby-3.3.6/bin/:$PATH"




if [ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then                                                                                                                 
  . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"                                                                                                                           
fi 

