-- Keymaps for vim built-in commands

-- Navigate vim panes better
-- vim.keymap.set('n', '<c-h>', ':bp<CR>')
-- vim.keymap.set('n', '<c-l>', ':bn<CR>')
-- vim.keymap.set('n', '<c-x>', ':bn|bd#<CR>')

-- Normal 모드에서 <C-[>를 누르면 하이라이트만 슥 닦아낸다
vim.keymap.set('n', '<C-[>', '<cmd>nohlsearch<CR>', { silent = true })
