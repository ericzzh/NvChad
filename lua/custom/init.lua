
-- local hooks = require "core.hooks"
--
-- hooks.add("setup_mappings", function(map)
--     -- format code
--     map("n", "<leader>mf", [[<Cmd> Neoformat<CR>]])
-- -- resize with arrows
-- -- **** Must set the Option key as Meta key in the xterm preference
-- -- **** Or use iterm2
--     map('n', '<M-UP>', '[[<Cmd> resize -2<CR>]]')
--     map('n', '<M-DOWN>', '[[<Cmd> resize +2<CR>]]')
--     map('n', '<M-LEFT>', '[[<Cmd> vertical resize -2<CR>]]')
--     map('n', '<M-RIGHT>', '[[<Cmd> vertical resize +2<CR>]]')
-- end)

-- hooks.add("install_plugins", function(use)
--     use {"sbdchd/neoformat", cmd = "Neoformat"}
-- end)

local map = require("core.utils").map

-- format code
map("n", "<leader>mf", [[<Cmd> Neoformat<CR>]])
-- resize with arrows
-- **** Must set the Option key as Meta key in the xterm preference
-- **** Or use iterm2
map('n', '<M-UP>', '[[<Cmd> resize -2<CR>]]')
map('n', '<M-DOWN>', '[[<Cmd> resize +2<CR>]]')
map('n', '<M-LEFT>', '[[<Cmd> vertical resize -2<CR>]]')
map('n', '<M-RIGHT>', '[[<Cmd> vertical resize +2<CR>]]')
