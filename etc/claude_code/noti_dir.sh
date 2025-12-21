#!/bin/bash

APP_NAME="iTerm"
PAYLOAD=$(tmux capture-pane -t "$TMUX_PANE" -p -S -20 | sed 's/\s*$//' | sed '/^[[:space:]]*$/d' | tail -n 10)

TMUX_SOCKET=$(tmux display-message -p "#{socket_path}")
TARGET_PANE="${TMUX_PANE:-$(tmux display-message -p '#{pane_id}')}"

# 알림만 띄우기
osascript -e "display notification \"$PAYLOAD\" with title \"Claude Code\" sound name \"Glass\""

# 바로 이동 (알림은 정보 표시용)
sleep 0.5
osascript -e "tell application \"$APP_NAME\" to activate"
tmux -S "$TMUX_SOCKET" select-window -t "$TARGET_PANE"
tmux -S "$TMUX_SOCKET" select-pane -t "$TARGET_PANE"
