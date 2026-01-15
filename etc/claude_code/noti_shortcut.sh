#!/bin/bash

# Apple 단축어를 이용한 알림 스크립트
# https://www.icloud.com/shortcuts/2a36067902a946feac354c83e4356242

CONTEXT=$(tmux capture-pane -t "$TMUX_PANE" -p -S -20 | sed 's/\s*$//' | sed '/^[[:space:]]*$/d' | tail -n 10)

# echo "$CONTEXT" | shortcuts run "ClaudeNotify"
echo "$CONTEXT" | shortcuts run "야 클로드가 할말잇대"
