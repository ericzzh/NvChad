vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = false,
    -- Enable virtual text, override spacing to 4
    virtual_text = false,
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    -- signs = function(bufnr, client_id)
    --   return vim.bo[bufnr].show_signs == false
    -- end,
    -- Disable a feature
    -- update_in_insert = false,
  }
)

-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {'gopls', 'tsserver', 'rust_analyzer','clangd', 'dartls', 'kotlin_language_server', 'sourcekit','solargraph'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
