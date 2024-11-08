local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff", "black", "isort" }, -- ruff for linting/fixing, black for formatting, isort for imports
    go = { "gofmt", "goimports" }, -- gofmt for formatting, goimports for import organization
    rust = { "rustfmt" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier", "eslint-lsp" }, -- prettier for formatting, eslint for linting
    typescript = { "prettier", "eslint-lsp" },
    markdown = { "prettier", "markdownlint-cli2" }, -- prettier for formatting, markdownlint for linting
    yaml = { "prettier", "yamllint" }, -- prettier for formatting, yamllint for linting
    sql = { "sqlfluff" },
    bash = { "shfmt", "shellcheck" }, -- shfmt for formatting, shellcheck for linting
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
