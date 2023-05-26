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
      ["<leader>el"] = {"<cmd>Telescope diagnostics<cr>", "Telescope diagnostics"},
      ["<leader>lo"] = {"<cmd>Telescope lsp_document_symbols<cr>", "Telescope document symbols"},
      ["<leader>lwo"] = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Telescope workspace symbols"},
    },
    v = {
      ["<leader>ca"] = {
        function()
          vim.lsp.buf.code_action()
        end,
        "lsp code_action",
      },
    },
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

  -- ["kyazdani42/nvim-tree.lua"] = {
  --     override_options = {
  --        view = {
  --           width = 35,
  --        },
  --     }
  -- },

  ["nvim-tree/nvim-tree.lua"] = {
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
             b.formatting.prettier,
             b.formatting.gofmt,
          }
          null_ls.setup {
             debug = true,
             sources = sources,
          }
       end,
  }
}

return M
