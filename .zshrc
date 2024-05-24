# external stuffs
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-navigation-tools
)

source $ZSH/oh-my-zsh.sh

function setup_starship() {
  if [[ `which starship` == "" ]] ; then
    echo "starship not found"
    return
  fi
  eval "$(starship init zsh)"
}

setup_starship

source "$HOME/.cargo/env"

# SECTION - ALIASES
alias ls=lsd
alias rm=trash
alias vim=nvim
alias vi=nvim
## wget alternative
alias wget="curl -O -L "

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

# SECTION - PATH

function setup_path {
  #export PATH="/opt/homebrew/bin:/opt/homebrew/opt/postgresql@15/bin:$PATH"
  
  # postgres
  POSTGRES_PATH="/opt/homebrew/opt/postgresql@15/bin"
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
}

setup_path


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

function download_image_tistory() {
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

# zoxide
eval "$(zoxide init zsh)"
alias cd=z
alias cdi=zi

# fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
