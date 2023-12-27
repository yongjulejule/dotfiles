#!/usr/bin/env bash

if [[ -d ./nvim ]]; then
    mkdir -p legacy
    mv nvim legacy/nvim-$(date +%Y%m%d%H%M%S)
fi

if [[ -d ./zsh ]]; then
    mkdir -p legacy
    mv zsh legacy/zsh-$(date +%Y%m%d%H%M%S)
fi

cp -R ~/.config/nvim/ nvim/
mkdir -p zsh
cp ~/.zshrc zsh/
cp ~/.p10k.zsh zsh/
