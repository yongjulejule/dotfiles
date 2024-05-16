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

.PHONY: help install setup_zsh setup_nvim setup_tmux setup_tmux_dependencies

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
	@$(MAKE) setup_zsh_dependencies
	
setup_zsh_dependencies:
	@printf "$(BLUE)Setting up zsh dependencies...$(RESET)\n"
	@# Install oh-my-zsh if not already installed
	@if [ ! -d "$(HOME)/.oh-my-zsh" ]; then \
		printf "$(YELLOW)Installing oh-my-zsh...$(RESET)\n"; \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	fi
	@$(MAKE) setup_starship

setup_starship:
	@# Install starship prompt
	@if ! command -v starship &> /dev/null; then \
		printf "$(YELLOW)Installing starship...$(RESET)\n"; \
		sh -c "$$(curl -fsSL https://starship.rs/install.sh)" -- --yes; \
	fi
	@ln -sf $(CURDIR)/starship.toml $(HOME)/.config/starship.toml
  @starship preset pastel-powerline -o ${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml
	

# Setup neovim
setup_nvim:
	@printf "$(BLUE)Setting up neovim...$(RESET)\n"
	@mkdir -p $(NVIM_DIR)
	@ln -sf $(CURDIR)/nvim/* $(NVIM_DIR)

# Setup tmux
setup_tmux:
	@printf "$(BLUE)Setting up tmux...$(RESET)\n"
	@ln -sf $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf
	@$(MAKE) setup_tmux_dependencies

# Install TPM and gitmux
setup_tmux_dependencies:
	@printf "$(BLUE)Setting up tmux dependencies...$(RESET)\n"
	@# Install TPM if not already installed
	@if [ ! -d "$(TPM_DIR)" ]; then \
		printf "$(YELLOW)Installing TPM...$(RESET)\n"; \
		git clone https://github.com/tmux-plugins/tpm $(TPM_DIR); \
	fi
	@# Install gitmux
	@if ! command -v gitmux &> /dev/null; then \
		printf "$(YELLOW)Installing gitmux...$(RESET)\n"; \
		brew tap arl/arl; \
		brew install gitmux; \
	fi
