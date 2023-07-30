return {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neoconf.nvim", { "williamboman/mason-lspconfig.nvim", config = true } },
    init = function()
        local ok, wf = pcall(require, "vim.lsp._watchfiles")
        if ok then
            wf._watchfunc = function() end
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<leader>lwl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>cf', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end,
    event = { "BufReadPre *.{lua,py,html,css,js,ts,json,yaml}", "BufNewFile *.{lua,py,html,css,js,ts,json,yaml}" },
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            },
            pyright = {},
            html = {},
            tailwindcss = {}
        },
    },
    config = function(_, opts)
        local servers = opts.servers
        for server, server_opts in pairs(servers) do
            require("lspconfig")[server].setup(server_opts)
        end
    end
}
