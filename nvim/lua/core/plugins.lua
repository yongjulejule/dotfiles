require("lazy").setup({
  { "catppuccin/nvim",       name = "mocha", priority = 1000 },
  { "numToStr/Comment.nvim", lazy = false },
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "stevearc/oil.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
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
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
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
  }
})
