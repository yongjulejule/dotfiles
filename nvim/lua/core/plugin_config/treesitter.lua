require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "vim", "html", "wgsl", "hcl" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

}

vim.filetype.add({ extension = { wgsl = "wgsl" } })

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wgsl = {
  install_info = {
    url = "https://github.com/szebniok/tree-sitter-wgsl",
    files = { "src/parser.c" }
  },
}
