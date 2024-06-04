require('telescope').setup({
  file_ignore_patterns = { "node%_modules/.*" },
  defaults = {
    layout_strategy = "flex",
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})
local builtin = require('telescope.builtin')

-- telescope official keymaps
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
-- vim.keymap.set('n', '<leader>ft', builtin.help_tags, { desc = 'Help tags' })

-- custom keymaps
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = 'Old files' })
vim.keymap.set('n', '<leader><leader>', builtin.resume, { desc = 'resume' })
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Git files' })


local function live_grep_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")

    return vim.v.shell_error == 0
  end

  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end

  local opts = {}

  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end

  require("telescope.builtin").live_grep(opts)
end

vim.keymap.set('n', '<leader>fG', live_grep_from_project_git_root, { desc = 'Live grep from project git root' })

require('telescope').load_extension('fzf')
