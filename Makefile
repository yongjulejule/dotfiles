# Colors
GREEN := \033[0;32m
YELLOW := \033[1;33m
RED := \033[0;31m
BLUE := \033[0;34m
RESET := \033[0m

# Define variables
ZSH_FILES := $(HOME)/.zshrc $(HOME)/.p10k.zsh
NVIM_DIR := $(shell echo $${XDG_CONFIG_HOME:-$$HOME/.config}/nvim)
TMUX_CONF := $(HOME)/.tmux.conf
TPM_DIR := $(HOME)/.tmux/plugins/tpm

.PHONY: help install setup_zsh setup_nvim setup_tmux

help:
	@printf "$(GREEN)Usage: make [target]$(RESET)\n"
	@printf "Managing Dotfiles using symbolic link\n"
	@printf "$(YELLOW)Targets:$(RESET)\n"
	@printf "  $(GREEN)install$(RESET)               Apply all dotfiles to this machine\n"

# Default target
install: setup_zsh setup_nvim setup_tmux

# Setup zsh
setup_zsh:
	@printf "$(BLUE)Setting up zsh dotfiles...$(RESET)\n"
	@ln -sf $(CURDIR)/.zshrc $(HOME)/.zshrc
	@ln -sf $(CURDIR)/.p10k.zsh $(HOME)/.p10k.zsh

# Setup neovim
setup_nvim:
	@printf "$(BLUE)Setting up neovim...$(RESET)\n"
	@mkdir -p $(NVIM_DIR)
	@ln -sf $(CURDIR)/nvim/* $(NVIM_DIR)

# Setup tmux
setup_tmux:
	@printf "$(BLUE)Setting up tmux...$(RESET)\n"
	@ln -sf $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf
