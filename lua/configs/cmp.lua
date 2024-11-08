local cmp = require "cmp"
local M = {}

M.setup = function()
  local existing_config = require "nvchad.configs.cmp"

  existing_config.sources = {
    {
      name = "copilot",
      max_item_count = 5,
    },
    {
      name = "avante",
    },
    {
      name = "nvim_lsp",
    },
    {
      name = "luasnip",
    },
    {
      name = "buffer",
    },
    {
      name = "nvim_lua",
    },
    {
      name = "path",
    },
  }

  -- Ensure completion is enabled
  existing_config.completion = {
    completeopt = "menu,menuone,noselect",
  }

  existing_config.sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.exact,
      require("copilot_cmp.comparators").prioritize,

      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  }

  return existing_config
end

return M
