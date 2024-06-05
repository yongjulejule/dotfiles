hs.hints.hintChars = { 'A', 'S', 'D', 'F', 'Q', 'W', 'E', 'R' }

hs.hotkey.bind({ 'option', 'control' }, 'tab', hs.hints.windowHints)



--[[ change language when go to normal mode ]]
local inputEnglish = "com.apple.keylayout.ABC"

function hello()
  local inputSource = hs.keycodes.currentSourceID()
  local log = hs.logger.new('my', 'debug')
  if not (inputSource == inputEnglish) then
    hs.keycodes.currentSourceID(inputEnglish)
  end
  hs.eventtap.keyStroke({}, 'escape')
end

hs.hotkey.bind({ 'control' }, 33, hello)
