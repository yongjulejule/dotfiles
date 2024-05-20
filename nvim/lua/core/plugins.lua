require("lazy").setup({
  { "catppuccin/nvim",       name = "mocha", priority = 1000 },
  { "numToStr/Comment.nvim", lazy = false },
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-treesitter/nvim-treesitter",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "stevearc/oil.nvim",
  "github/copilot.vim",
  -- mason
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- lint
  "mfussenegger/nvim-lint",
  "rshkarin/mason-nvim-lint",
  -- formatter
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  -- lsp
  "neovim/nvim-lspconfig",
  "L3MON4D3/LuaSnip",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  "wakatime/vim-wakatime",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  -- UI
  {
    'nvim-lualine/lualine.nvim', -- statusline
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'akinsho/bufferline.nvim', -- bufferline
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  -- etc
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  {
    'goolord/alpha-nvim',
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },

  }
})
