# environ
alias vim=nvim
alias vi=nvim
# wget alternative
alias wget="curl -O -L "
export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR=`which nvim`

export LANG=en_US.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export XDG_CONFIG_HOME="$HOME/.config"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-navigation-tools
)

# external stuffs
source $ZSH/oh-my-zsh.sh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# alias 
#alias vi=nvim
#alias vim=nvim
alias ls=lsd
alias rm=trash

# kubectl completion
source <(kubectl completion zsh)

# aws completion

# stripe completion
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i

autoload -Uz compinit && compinit
export AWS_DEFAULT_PROFILE=seesoio


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source "$HOME/.cargo/env"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/opt/homebrew/bin/aws_completer' aws


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

  # pnpm
  export PNPM_HOME="/Users/yongjunlee/Library/pnpm"

  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac # pnpm end

  # go bin
  export GO_PATH="${HOME}/go/bin"

  case ":$PATH:" in
    *":$GO_PATH:"*) ;;
    *) export PATH="$PATH:$GO_PATH" ;;
  esac # go end
}

setup_path

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



# bun completions
[ -s "/Users/yongjunlee/.bun/_bun" ] && source "/Users/yongjunlee/.bun/_bun"

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


function ollama-sum {
  ( echo '[INST]Summarize the following text :'
    links -codepage utf-8 \
          -force-html \
          -width 500 \
          -dump $1 |
      sed 's/   */ /'
  echo '[/INST]') | ollama run mistral
}
