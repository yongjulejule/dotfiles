#!/usr/bin/env bash

if [[ -d ./nvim ]]; then
    mkdir -p legacy
    cp -R nvim legacy/nvim-$(date +%Y%m%d%H%M%S)
fi

if [[ -d ./zsh ]]; then
    mkdir -p legacy
    cp -R zsh legacy/zsh-$(date +%Y%m%d%H%M%S)
fi

if [[ -d ./tmux ]]; then
  mkdir -p legacy
  cp -R tmux legacy/tmux-$(date +%Y%m%d%H%M%S)
fi

cp -R ~/.config/nvim/ nvim/
mkdir -p zsh
cp ~/.zshrc zsh/
cp ~/.p10k.zsh zsh/

mkdir -p tmux
cp ~/.tmux.conf tmux/
