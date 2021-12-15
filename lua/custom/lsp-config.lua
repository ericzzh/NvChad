local M={}

M.setup_lsp = function(on_attach, capabilities)
    local function setup_servers()
        local lspconf = require("lspconfig")

        local servers = {'gopls', 'tsserver','sumneko_lua'}
        for _, lang in ipairs(servers) do

            if lang == "sumneko_lua" then
                lspconf[lang].setup {
                    on_attach = on_attach,
                    root_dir = vim.loop.cwd,
                    settings = {
                        Lua = {
                            runtime = {
                              version = 'LuaJIT',
                            },
                            diagnostics = {
                                globals = {"vim"}
                            },
                            workspace = {
                              library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = {
                                enable = false
                            }
                        }
                    }
                }
            else
                lspconf[lang].setup {
                    on_attach = on_attach,
                    root_dir = vim.loop.cwd
                }
            end
        end
    end

    setup_servers()
end
return M
