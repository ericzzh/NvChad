local M = {}

M.mappings = {
  general = {
    n = {
      ["<A-UP>"] = {"<Cmd> resize -2<CR>","resize window up"},
      ["<A-DOWN>"] = {"<Cmd> resize +2<CR>","resize window down"},
      ["<A-LEFT>"] = {"<Cmd> vertical resize -2<CR>","resize window left"},
      ["<A-RIGHT>"] = {"<Cmd> vertical resize +2<CR>","resize window right"},
    },
  },

  lspconfig = {
    n = {
      ["gd"] = {"<cmd>Telescope lsp_definitions<cr>", "definition list"},
      ["gi"] = {"<cmd>Telescope lsp_implementations<cr>", "implementation list"},
      ["gr"] = {"<cmd>Telescope lsp_references<cr>", "code reference list"},
      ["ge"] = {"<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>", "show line diagnostics"},
      ["<leader>cr"] = {"<cmd>'<,'> lua vim.lsp.buf.range_code_action()<cr>", "code range actions"},
      ["<leader>el"] = {"<cmd>Telescope diagnostics<cr>", "Telescope diagnostics"},
      ["<leader>lo"] = {"<cmd>Telescope lsp_document_symbols<cr>", "Telescope document symbols"},
      ["<leader>lwo"] = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Telescope workspace symbols"},
    }

  }
}
M.plugins = {

  ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.lspconfig"
      end,
  },

  -- ["sbdchd/neoformat"] = {
  --     cmd = "Neoformat"
  -- },

  ["kyazdani42/nvim-tree.lua"] = {
      override_options = {
         view = {
            width = 35,
         },
      }
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
       after = "nvim-lspconfig",
       config = function()
          local present, null_ls = pcall(require, "null-ls")
          if not present then
             return
          end
          local b = null_ls.builtins
          local sources = {
             -- webdev stuff
             -- b.formatting.deno_fmt,
             b.formatting.prettier,
             -- Lua
             -- b.formatting.stylua,
             -- Shell
             -- b.formatting.shfmt,
             -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
          }
          null_ls.setup {
             debug = true,
             sources = sources,
          }
       end,
  }
}

return M
