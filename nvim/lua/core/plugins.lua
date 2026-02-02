require("lazy").setup({
  { "catppuccin/nvim",       name = "Latte", priority = 1000 },
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
  -- lsp
  "neovim/nvim-lspconfig",
  "L3MON4D3/LuaSnip",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "wakatime/vim-wakatime",
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
    "tris203/precognition.nvim",
    -- event = "VeryLazy",
    opts = {
      -- startVisible = true,
      -- showBlankVirtLine = true,
      -- highlightColor = { link = "Comment" },
      -- hints = {
      --      Caret = { text = "^", prio = 2 },
      --      Dollar = { text = "$", prio = 1 },
      --      MatchingPair = { text = "%", prio = 5 },
      --      Zero = { text = "0", prio = 1 },
      --      w = { text = "w", prio = 10 },
      --      b = { text = "b", prio = 9 },
      --      e = { text = "e", prio = 8 },
      --      W = { text = "W", prio = 7 },
      --      B = { text = "B", prio = 6 },
      --      E = { text = "E", prio = 5 },
      -- },
      -- gutterHints = {
      --     G = { text = "G", prio = 10 },
      --     gg = { text = "gg", prio = 9 },
      --     PrevParagraph = { text = "{", prio = 8 },
      --     NextParagraph = { text = "}", prio = 8 },
      -- },
    },
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

  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  { "sindrets/diffview.nvim" },
})
