local M={}

M.setup_lsp = function(on_attach, capabilities)

    local function custom_on_attach(_, bufnr)
       local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
       end
       local function buf_set_option(...)
          vim.api.nvim_buf_set_option(bufnr, ...)
       end
       -- Enable completion triggered by <c-x><c-o>
       buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
       -- Mappings.
       local opts = { noremap = true, silent = true }
       -- See `:help vim.lsp.*` for documentation on any of the below functions
       -- buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
       -- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
       -- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
       -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
       -- buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
       -- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
       -- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
       -- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
       -- buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
       -- buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
       -- buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap('n', '<space>ca', '<cmd>Telescope lsp_code_actions<cr>', opts)
       -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
        buf_set_keymap("n", "ge", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
       -- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
       -- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
       -- buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
       -- buf_set_keymap("v", "<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
	buf_set_keymap('v', '<space>cr', "<cmd>'<,'> lua vim.lsp.buf.range_code_action()<cr>", opts)
	buf_set_keymap('n', '<space>es', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '<space>el', '<cmd>Telescope diagnostics<cr>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<space>lo", '<cmd>Telescope lsp_document_symbols<cr>', opts)
	buf_set_keymap("n", "<space>lwo", '<cmd>Telescope lsp_workspace_symbols<cr>', opts)
    end

    local function setup_servers()
        local lspconf = require("lspconfig")

        local servers = {'gopls', 'tsserver','sumneko_lua'}
        for _, lang in ipairs(servers) do

            if lang == "sumneko_lua" then
                lspconf[lang].setup {
                    on_attach = custom_on_attach,
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
                    on_attach = custom_on_attach,
                    root_dir = vim.loop.cwd
                }
            end
        end
    end

    setup_servers()
end
return M
