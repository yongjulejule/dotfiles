# zsh

- `$HOME/.zshrc`
- `$HOME/.p10k.zsh`

# neovim

- `${XDG_CONFIG_HOME:-$HOME/.config}/nvim`
  - tree sitter wgsl 추가 설치 필요 https://github.com/szebniok/tree-sitter-wgsl

# tmux

## tmux

`brew install tmux`

- `<leader> + I` to install plugins using TPM
- `<leader> + U` to update plugin
- `tmux source ${HOME}/.tmux.conf` to apply `.tmux.conf`

### TPM (Tmux Plugin Manager)

- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
