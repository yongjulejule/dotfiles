#!/bin/bash

CONTEXT=$(tmux capture-pane -t "$TMUX_PANE" -p -S -20 | sed 's/\s*$//' | sed '/^[[:space:]]*$/d' | tail -n 10)

# echo "$CONTEXT" | shortcuts run "ClaudeNotify"
echo "$CONTEXT" | shortcuts run "야 클로드가 할말잇대"
