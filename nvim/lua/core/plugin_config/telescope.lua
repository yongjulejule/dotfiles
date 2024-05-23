require('telescope').setup({
  file_ignore_patterns = { "node%_modules/.*" },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
    help_tags = {
      theme = "dropdown",
    },
  },
})
local builtin = require('telescope.builtin')

-- telescope official keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

-- custom keymaps
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, { desc = 'Old files' })
vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = 'Git files' })
