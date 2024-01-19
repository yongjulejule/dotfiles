# zsh

- `$HOME/.zshrc`
- `$HOME/.p10k.zsh`

# neovim

- `$HOME/.config/nvim/`
- `${XDG_CONFIG_HOME:-$HOME/.config}/nvim`
  - tree sitter wgsl 추가 설치 필요 https://github.com/szebniok/tree-sitter-wgsl

# hammerspoon

- `brew install hammerspoon --cask`
- `cp -R hammerspoon/* ${XDG_CONFIG_HOME}/.hammerspoon/`

# scripts

## check-diff.sh

- 로컬과 dotfiles 의 diff 를 체크하는 스크립트
- `local_dir`, `backup_dir` 수정 필요할 수 있음
- 일단 nvim 만 비교함

## copy-dotfiles.sh

- 로컬 config 파일들을 현재 디렉토리로 옮겨옴
- 현재 디렉토리에 있는 파일들은 legacy/pathname-timestamp 디렉토리에 옮김
