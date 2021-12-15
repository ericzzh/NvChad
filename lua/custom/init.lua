
local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
    -- format code
    map("n", "<leader>mf", [[<Cmd> Neoformat<CR>]])
end)

hooks.add("install_plugins", function(use)
    use {"sbdchd/neoformat", cmd = "Neoformat"}
end)
