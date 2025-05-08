# external stuffs
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-navigation-tools
)

ZSH="${HOME}/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

source "$HOME/.cargo/env"

# SECTION - ALIASES
alias ls=lsd
alias rm=trash
alias vim=nvim
alias vi=nvim
alias nvimdiff='nvim -d'
## wget alternative
alias wget="curl -O -L "

# terraform
alias tf=terraform

# SECTION - ENVIRONMENT VARIABLES

export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=`which nvim`
export LANG=en_US.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export XDG_CONFIG_HOME="$HOME/.config"


# SECTION - KEY BINDINGS

bindkey ^h backward-delete-char # same to default
bindkey ^j down-line-or-beginning-search
bindkey ^k up-line-or-beginning-search
bindkey ^l forward-char

# SECTION - PATH

function setup_path {
  POSTGRES_PATH="/opt/homebrew/opt/postgresql@16/bin"
  case ":$PATH:" in
    *":$POSTGRES_PATH:"*) ;;
    *) export PATH="$POSTGRES_PATH:$PATH" ;;
  esac # postgres end

  # bun
  export BUN_INSTALL="$HOME/.bun"
  export BUN_PATH="$BUN_INSTALL/bin"

  case ":$PATH:" in
    *":$BUN_PATH:"*) ;;
    *) export PATH="$BUN_PATH:$PATH" ;;
  esac # bun end


  # go bin
  export GO_PATH="${HOME}/go/bin"

  case ":$PATH:" in
    *":$GO_PATH:"*) ;;
    *) export PATH="$PATH:$GO_PATH" ;;
  esac # go end

  # pnpm
  export PNPM_HOME="/Users/yongjunlee/Library/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac # pnpm end
}

setup_path


# SECTION - Completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## kubectl completion
source <(kubectl completion zsh)

## aws completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/opt/homebrew/bin/aws_completer' aws

# bun completions
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"


# Terraform completions
# terraform -install-autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# pnpm completions

[ -s "${HOME}/.local/share/completion-for-pnpm.zsh" ] || pnpm completion zsh > "${HOME}/.local/share/completion-for-pnpm.zsh"
source "${HOME}/.local/share/completion-for-pnpm.zsh"

# SECTION - my functions

function gtg {
  git remote get-url origin | xargs open
}

function trans-vim {
  local temp=$(mktemp)
  local temp2=$(mktemp)
  local input
  if [[ -z $1 ]] ; then
    local text=$(cat -)
    echo $text > $temp2
    input=$temp2
  else
    input=$1
  fi
  trans -no-auto -b -i $input :ko  >$temp
  vi -O $input $temp
  rm $temp $temp2
}

function pbpasteToFile {
  if [[ -z $1 ]] ; then
    echo "Usage: pbpasteToFile <filename>"
    return
  fi
  pbpaste > $1
}

function download_image_tistory {
    # Step 1: Get link from clipboard
    link=$(pbpaste)

    # Step 2: Extract the value of the query string parameter 'fname'
    fname=${link#*fname=}

    # Step 3: URL decode the value of 'fname'
    decoded_fname=$(echo -e "${fname//%/\\x}")

    extension="${decoded_fname##*.}"

    # Step 4: Run curl -O with the decoded filename
    curl -o $(date -Iseconds).${extension} "$decoded_fname"
}

# SECTION - External programs

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# starship
function setup_starship {
  eval "$(starship init zsh)"
}

command -v starship &>/dev/null && setup_starship

setup_starship
# zoxide

function setup_zoxide {
  eval "$(zoxide init zsh)"
  alias cd=z
  alias cdi=zi
}
command -v zoxide &>/dev/null && setup_zoxide

# fzf


function setup_fzf {
  eval "$(fzf --zsh)"
  export FZF_DEFAULT_OPTS=" \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
}

command -v fzf &>/dev/null && setup_fzf

test -e "${HOME}/.secrets" && source ${HOME}/.secrets

command -v nx && source ${HOME}/.nx-completion/nx-completion.plugin.zsh


function jamo_to_ascii() {
  BUFFER=${BUFFER//ㅂ/q}
  BUFFER=${BUFFER//ㅈ/w}
  BUFFER=${BUFFER//ㄷ/e}
  BUFFER=${BUFFER//ㄱ/r}
  BUFFER=${BUFFER//ㅅ/t}
  BUFFER=${BUFFER//ㅛ/y}
  BUFFER=${BUFFER//ㅕ/u}
  BUFFER=${BUFFER//ㅑ/i}
  BUFFER=${BUFFER//ㅐ/o}
  BUFFER=${BUFFER//ㅔ/p}
  BUFFER=${BUFFER//ㅁ/a}
  BUFFER=${BUFFER//ㄴ/s}
  BUFFER=${BUFFER//ㅇ/d}
  BUFFER=${BUFFER//ㄹ/f}
  BUFFER=${BUFFER//ㅎ/g}
  BUFFER=${BUFFER//ㅗ/h}
  BUFFER=${BUFFER//ㅓ/j}
  BUFFER=${BUFFER//ㅏ/k}
  BUFFER=${BUFFER//ㅣ/l}
  BUFFER=${BUFFER//ㅋ/z}
  BUFFER=${BUFFER//ㅌ/x}
  BUFFER=${BUFFER//ㅊ/c}
  BUFFER=${BUFFER//ㅍ/v}
  BUFFER=${BUFFER//ㅠ/b}
  BUFFER=${BUFFER//ㅜ/n}
  BUFFER=${BUFFER//ㅡ/m}
}

function jamo_accept_line() {
  jamo_to_ascii    # 먼저 자모→영문으로 치환
  zle .accept-line # 원래 accept-line(Enter) 동작 수행
}

function enable_hangul_jamo_mapping() {
  zle -N accept-line jamo_accept_line
}

