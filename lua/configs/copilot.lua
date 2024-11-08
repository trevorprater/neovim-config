return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "hrsh7th/nvim-cmp" },
      config = function()
        require("copilot_cmp").setup()
      end,
    },
  },
  config = function()
    require("copilot").setup {
      suggestion = {
        enabled = false,
        auto_trigger = false,
        debounce = 100,
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    }
  end,
}
