require("catppuccin").setup({
  flavour = "latte",
  transparent_background = true,
  styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
  },
})

vim.o.termguicolors = true
-- vim.o.background = "white"
vim.cmd [[colorscheme catppuccin]]
