#!/bin/bash

# ==========================================
APP_NAME="iTerm"
TMUX_PATH="/opt/homebrew/bin" 
PATH="$TMUX_PATH:$PATH"
# ==========================================

PAYLOAD=$(tmux capture-pane -t "$TMUX_PANE" -p -S -20 | sed 's/\s*$//' | sed '/^[[:space:]]*$/d' | tail -n 10)

# 만약 캡처 실패했거나 내용 없으면 기본값
if [ -z "$PAYLOAD" ]; then
    PAYLOAD="Claude Code가 입력을 기다립니다."
fi

# 2. Tmux 소켓/Pane 정보 확보 (이동용)
TMUX_SOCKET=$(tmux display-message -p "#{socket_path}")
# $TMUX_PANE이 환경변수에 있다면 그걸 쓰고, 없으면 현재 Pane 조회
TARGET_PANE="${TMUX_PANE:-$(tmux display-message -p '#{pane_id}')}"


RESPONSE=$(osascript -e "
    tell application \"System Events\"
        set resultObj to display alert \"나 클로든디\" message \"$PAYLOAD\" buttons {\"이동하기\", \"무시\"} default button \"이동하기\"
        return button returned of resultObj
    end tell
")

if [ "$RESPONSE" = "이동하기" ]; then
    osascript -e "tell application \"$APP_NAME\" to activate"
    tmux -S "$TMUX_SOCKET" select-window -t "$TARGET_PANE"
    tmux -S "$TMUX_SOCKET" select-pane -t "$TARGET_PANE"
fi
