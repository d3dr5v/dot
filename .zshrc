export ZSH="$HOME/.oh-my-zsh"
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

alias vi="nvim"
alias v="vim"
alias vim="nvim"
alias @="cd ~/@/"
alias ls="ls --color"

function llm() {
   if [ $# -ne 1 ]; then
       echo "Usage: llm <string>"
       return 1
   fi

   local input_string="$1"

   echo "$input_string" | chatgpt-cli --non-interactive
}

function define() {
  local prefix="Define: "
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

function llmi() {
  chatgpt-cli --multiline
}

function c() {
    awk "BEGIN { print $1 }"
}

function gacp() {
    git add .
    git commit -a -m "$1"
    git push
}

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"











if [ -z "$OPENAI_API_KEY" ]; then
  echo "OPENAI_API_KEY is not set. Retrieving from AWS Secrets Manager..."

  SECRET_VALUE=$(AWS_PROFILE=davidroussov aws secretsmanager get-secret-value --secret-id "openai.api_key" --query 'SecretString' --output text 2>/dev/null)

  if [ $? -ne 0 ]; then
      exit 1
  fi

  export OPENAI_API_KEY="$SECRET_VALUE"
fi






