# Claude Code + Tmux 입력 대기 알림 설정

Claude Code를 tmux에서 사용할 때, 입력이 필요한 순간 macOS 알림을 받고 클릭 한 번으로 해당 pane으로 이동하는 설정입니다.

## 작동 방식

1. Claude Code가 입력 대기 상태가 되면 Hook 실행
2. Tmux 화면의 최근 10줄을 캡처하여 컨텍스트 확인
3. 화면 중앙에 팝업 표시 (질문 내용 포함)
4. **"이동"** 버튼 클릭 시 자동으로 해당 tmux pane으로 포커스 이동
5. 10초 후 자동으로 사라짐

## 설정 방법

### 1. 알림 스크립트 생성

`~/.claude/notify.sh` 파일 생성:

```bash
#!/bin/bash

# 사용 중인 터미널 앱 이름 (iTerm, Cursor, Terminal 등)
APP_NAME="iTerm"

# Tmux 화면에서 최근 10줄 캡처 (공백 제거)
PAYLOAD=$(tmux capture-pane -t "$TMUX_PANE" -p -S -20 | sed 's/\s*$//' | sed '/^[[:space:]]*$/d' | tail -n 10)

# Tmux 정보 확보
TMUX_SOCKET=$(tmux display-message -p "#{socket_path}")
TARGET_PANE="${TMUX_PANE:-$(tmux display-message -p '#{pane_id}')}"

# 팝업 표시 및 버튼 클릭 대기
RESPONSE=$(osascript -e "tell application \"System Events\" to display alert \"Claude Code\" message \"$PAYLOAD\" buttons {\"이동\", \"무시\"} default button \"이동\" giving up after 10")

# "이동" 버튼 클릭 시 터미널로 이동
if [[ "$RESPONSE" == *"이동"* ]]; then
    osascript -e "tell application \"$APP_NAME\" to activate"
    tmux -S "$TMUX_SOCKET" select-window -t "$TARGET_PANE"
    tmux -S "$TMUX_SOCKET" select-pane -t "$TARGET_PANE"
fi
```

실행 권한 부여:

```bash
chmod +x ~/.claude/notify.sh
```

### 2. Claude Code 설정

`~/.claude/settings.json` 파일에 Hook 추가:

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": ".*",
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/notify.sh"
          }
        ]
      }
    ]
  }
}
```

### 3. 권한 설정

**시스템 설정 → 개인정보 보호 및 보안 → 자동화**에서:

- 사용 중인 터미널(iTerm/Cursor 등)에 **System Events** 제어 권한 허용

## 커스터마이징

### 캡처 라인 수 조정

더 많은 컨텍스트를 보려면:

```bash
# -S -20 → -S -50 (50줄 히스토리)
# tail -n 10 → tail -n 20 (최근 20줄 표시)
```

# 스크립트 종류

- `noti.sh` - 팝업 + 버튼 클릭 방식
- `noti_dir.sh` - 배너 알림 + 자동 이동 방식
- `noti_shortcut.sh` - macOS 단축어 활용 방식
