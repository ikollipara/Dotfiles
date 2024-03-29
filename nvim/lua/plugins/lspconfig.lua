local LSP_FILE_EXTENSIONS = {
	"lua",
	"py",
	"html",
	"css",
	"js",
	"ts",
	"json",
	"yaml",
	"astro",
	"go",
	"hs",
	"tsx",
	"jsx",
	"zig",
	"zir",
	"mjs",
	"cjs",
	"djhtml",
	"edge",
	"tex",
}
return {
	"neovim/nvim-lspconfig",
	dependencies = { "folke/neoconf.nvim", { "williamboman/mason-lspconfig.nvim", config = true } },
	init = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>cwr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>cwl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>cD", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end,
		})
	end,
	event = {
		"BufReadPre *.{" .. table.concat(LSP_FILE_EXTENSIONS, ",") .. "}",
		"BufNewFile *.{" .. table.concat(LSP_FILE_EXTENSIONS, ",") .. "}",
	},
	opts = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								-- Make the server aware of Neovim runtime files
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
				pyright = {
					settings = {
						venv_path = "./.venv",
					},
				},
				html = {
					filetypes = { "html", "htmldjango", "edge" },
					capabilities = capabilities,
				},
				cssls = {},
				tailwindcss = {},
				astro = {},
				gopls = {},
				hls = {},
				tsserver = {},
				yamlls = {},
				zls = {},
				texlab = {},
				emmet_language_server = {
					filetypes = {
						"astro",
						"css",
						"eruby",
						"html",
						"htmldjango",
						"javascriptreact",
						"less",
						"pug",
						"sass",
						"scss",
						"svelte",
						"typescriptreact",
						"vue",
						"edge",
					},
				},
			},
		}
	end,
	config = function(_, opts)
		for server, server_opts in pairs(opts.servers) do
			require("lspconfig")[server].setup(server_opts)
		end
	end,
}
