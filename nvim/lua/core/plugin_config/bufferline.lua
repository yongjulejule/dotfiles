local latte = {
  rosewater = "#dc8a78",
  flamingo  = "#dd7878",
  pink      = "#ea76cb",
  mauve     = "#8839ef",
  red       = "#d20f39",
  maroon    = "#e64553",
  peach     = "#fe640b",
  yellow    = "#df8e1d",
  green     = "#40a02b",
  teal      = "#179299",
  sky       = "#04a5e5",
  sapphire  = "#209fb5",
  blue      = "#1e66f5",
  lavender  = "#7287fd",
  text      = "#4c4f69",
  subtext1  = "#5c5f77",
  subtext0  = "#6c6f85",
  overlay2  = "#7c7f93",
  overlay1  = "#8c8fa1",
  overlay0  = "#9ca0b0",
  surface2  = "#acb0be",
  surface1  = "#bcc0cc",
  surface0  = "#ccd0da",
  base      = "#eff1f5",
  mantle    = "#e6e9ef",
  crust     = "#dce0e8",
}

require("bufferline").setup({
  options = {
    separator_style = "slant", -- 'slant' | 'thick' | 'thin' | {'any', 'any'}
    indicator = {
      style = "icon",
      icon = "▎",
    },
    modified_icon = "●",
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
  highlights = {
    -- 빈 공간 (Tab bar background)
    fill = {
      fg = latte.overlay0,
      bg = latte.mantle,
    },

    -- 비활성 버퍼 (Inactive)
    background = {
      fg = latte.overlay1,
      bg = latte.mantle,
    },

    -- 활성 버퍼 (Active - Focused)
    buffer_selected = {
      fg = latte.text,
      bg = latte.base, -- 에디터 배경과 일치시킴
      bold = true,
      italic = true,
    },

    -- 구분선 (Separators)
    separator = {
      fg = latte.mantle, -- 배경색과 동일하게 하여 숨김 처리 효과 (또는 crust)
      bg = latte.mantle,
    },
    separator_selected = {
      fg = latte.mantle,
      bg = latte.base,
    },

    -- 탭 닫기 버튼
    close_button = {
      fg = latte.overlay0,
      bg = latte.mantle,
    },
    close_button_selected = {
      fg = latte.red,
      bg = latte.base,
    },

    -- 수정된 파일 (Modified)
    modified = {
      fg = latte.peach,
      bg = latte.mantle,
    },
    modified_selected = {
      fg = latte.peach,
      bg = latte.base,
    },

    -- 진단: 에러 (Error)
    error = {
      fg = latte.red,
      bg = latte.mantle,
    },
    error_selected = {
      fg = latte.red,
      bg = latte.base,
      bold = true,
    },
    error_diagnostic = {
      fg = latte.red,
      bg = latte.mantle,
    },
    error_diagnostic_selected = {
      fg = latte.red,
      bg = latte.base,
      bold = true,
    },

    -- 진단: 경고 (Warning)
    warning = {
      fg = latte.yellow,
      bg = latte.mantle,
    },
    warning_selected = {
      fg = latte.yellow,
      bg = latte.base,
      bold = true,
    },
    warning_diagnostic = {
      fg = latte.yellow,
      bg = latte.mantle,
    },
    warning_diagnostic_selected = {
      fg = latte.yellow,
      bg = latte.base,
      bold = true,
    },

    -- 진단: 정보 (Info)
    info = {
      fg = latte.blue,
      bg = latte.mantle,
    },
    info_selected = {
      fg = latte.blue,
      bg = latte.base,
      bold = true,
    },
    info_diagnostic = {
      fg = latte.blue,
      bg = latte.mantle,
    },
    info_diagnostic_selected = {
      fg = latte.blue,
      bg = latte.base,
      bold = true,
    },

    -- 진단: 힌트 (Hint)
    hint = {
      fg = latte.teal,
      bg = latte.mantle,
    },
    hint_selected = {
      fg = latte.teal,
      bg = latte.base,
      bold = true,
    },
    hint_diagnostic = {
      fg = latte.teal,
      bg = latte.mantle,
    },
    hint_diagnostic_selected = {
      fg = latte.teal,
      bg = latte.base,
      bold = true,
    },

    -- Active Indicator (왼쪽 막대)
    indicator_selected = {
      fg = latte.mauve,
      bg = latte.base,
    },
  }
})
