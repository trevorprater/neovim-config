return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  require "configs.lazygit",
  require "configs.treesitter",
  require "configs.avante",
  require "configs.copilot",
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("configs.cmp").setup()
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
}
