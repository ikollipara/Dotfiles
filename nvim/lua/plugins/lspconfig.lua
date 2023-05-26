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
				experimental = { pathStrict = true },
			},
			ft = "lua",
		},
		{
			"williamboman/mason.nvim",
			config = true,
			keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Open Mason" } },
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
				"f3fora/cmp-spell",
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
						{
							name = "spell",
							enable_in_context = function()
								return require("cmp.config.context").in_treesitter_capture("spell")
							end,
						},
					}),
				}
			end,
		},
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
			gopls = {},
			astro = {},
			elmls = {},
			vuels = {},
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd("BufWrite", {
			callback = function()
				vim.lsp.buf.format()
			end,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				vim.keymap.set("n", "<leader>cli", "<cmd>LspInfo<cr>", { desc = "See LSP Info" })
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to Definition" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Signature" })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Go to References" })
				vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol, { desc = "Go to Symbol" })
				vim.keymap.set("n", "<leader>clr", vim.lsp.buf.rename, { desc = "Rename" })
				vim.keymap.set("n", "<leader>cla", vim.lsp.buf.code_action, { desc = "Execute Code Action" })
				vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Buffer" })
				vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Go to Signature" })
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "See Signature" })
			end,
		})
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local function setup(server)
			local serverOpts =
				vim.tbl_deep_extend("force", { capabilities = vim.deepcopy(capabilities) }, opts.servers[server] or {})
			require("lspconfig")[server].setup(serverOpts)
		end
		for server, _ in pairs(opts.servers) do
			setup(server)
		end
	end,
}
