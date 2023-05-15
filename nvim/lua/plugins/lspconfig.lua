--[[
-- lspconfig.lua
-- Ian Kollipara
-- 2023.03.10
--
-- LSPConfig Configuration
--]]

return { 
    "neovim/nvim-lspconfig", 
    event = { "BufReadPre", "BufNewFile" }, 
    dependencies = {
        { 
            "folke/neodev.nvim", 
            opts = { 
                experimental = { pathStrict = true } 
            }, 
            ft = "lua" }, 
        {
            "williamboman/mason.nvim", 
            config = true, 
            keys = { { "<leader>cm", "<cmd>Mason<cr>" } }
        },
        { 
            "hrsh7th/nvim-cmp",
            version = false,
            event = "InsertEnter",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
            },
            opts = function()
                local cmp = require("cmp")
                return {
                  completion = {
                      completeopt = "menu,menuone,noinsert",
                  },
                  snippet = {
                      expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                      end,
                  },
                  mapping = cmp.mapping.preset.insert({
                      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                      ["<C-f>"] = cmp.mapping.scroll_docs(4),
                      ["<C-Space>"] = cmp.mapping.complete(),
                      ["<C-e>"] = cmp.mapping.abort(),
                      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                      ["<S-CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                      }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                  }),
                  sources = cmp.config.sources({
                      { name = "nvim_lsp" },
                      { name = "luasnip" },
                      { name = "buffer" },
                      { name = "path" },
                  }),
                }
            end,
        }
    },
    opts = { 
        servers = { 
            lua_ls = {}, 
            pyright = {}, 
            texlab = {}, 
            intelephense = {}, 
            tsserver = {}, 
            html = {}, 
            cssls = {}, 
            gopls = {}
        }
    }, 
    config = function(_, opts) 
        vim.api.nvim_create_autocmd("BufWrite", { 
            callback = function() 
                vim.lsp.buf.format() end
        }) 

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function () 
               vim.keymap.set("n", "<leader>cli", "<cmd>LspInfo<cr>") 
               vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
               vim.keymap.set("n", "K", vim.lsp.buf.hover)
               vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
               vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
               vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
               vim.keymap.set("n", "<leader>clr", vim.lsp.buf.rename)
               vim.keymap.set("n", "<leader>cla", vim.lsp.buf.code_action)
               vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
               vim.keymap.set("n", "gK", vim.lsp.buf.signature_help)
               vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
            end })
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local function setup(server)
            local serverOpts = vim.tbl_deep_extend("force", { capabilities = vim.deepcopy(capabilities) }, opts.servers[server] or {})
            require("lspconfig")[server].setup(serverOpts) 
        end 
        for server, _ in pairs(opts.servers) do 
            setup(server) 
        end 
    end }
