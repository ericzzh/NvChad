-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.lsp-config", -- path of file containing setups of different lsps
      },
    nvimtree = {
         ui = {
            auto_resize = true,
            width = 35,
         },
      },
  },
  user = {
     ["sbdchd/neoformat"] = {
       cmd = "Neoformat"
     }
  },
}

M.options = {
   -- load your options here or load module with options1
   user = function() 
     local opt = vim.opt
     opt.fileencodings="utf-8,sjis,cp932,default"
   end,

}
return M
