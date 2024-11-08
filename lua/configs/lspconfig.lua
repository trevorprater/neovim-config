-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "rust-analyzer",
  "pyright",
  "protolint",
  "json-to-struct",
  "gopls",
  "golangci-lint-langserver",
  "ast-grep",
  "ansible-language-server",
  "eslint-lsp",
  "lua-language-server",
  "marksman",
  "yaml-language-server",
  "cssls",
  "html",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
