---------------------------
-- null-ls.lua
-- Ian Kollipara
-- 2023.05.15
--
-- null-ls Configuration
---------------------------

return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim" },
	opts = function()
		local nls = require("null-ls")

		return {
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
			sources = {
				-- Formatters
				nls.builtins.formatting.black.with({
					timeout = 10000,
				}),
				nls.builtins.formatting.codespell.with({
					timeout = 10000,
				}),
				nls.builtins.formatting.elm_format.with({
					timeout = 10000,
				}),
				nls.builtins.formatting.eslint.with({
					extra_filetypes = { "typescriptreact" },
					timeout = 10000,
				}),
				nls.builtins.formatting.isort.with({
					timeout = 10000,
				}),
				nls.builtins.formatting.markdownlint.with({
					timeout = 10000,
				}),
				nls.builtins.formatting.markdown_toc.with({
					timeout = 10000,
				}),
				nls.builtins.formatting.mdformat.with({
					timeout = 10000,
				}),
				nls.builtins.formatting.prettier.with({
					extra_filetypes = { "typescriptreact" },
					timeout = 10000,
				}),
				nls.builtins.formatting.stylua.with({
					timeout = 10000,
				}),

				-- Code Actions
				nls.builtins.code_actions.eslint.with({
					extra_filetypes = { "typescriptreact" },
					timeout = 10000,
				}),
				nls.builtins.code_actions.proselint.with({
					extra_filetypes = { "typescriptreact" },
					timeout = 10000,
				}),

				-- Completion
				nls.builtins.completion.spell.with({
					timeout = 10000,
				}),

				-- Diagnostics
				nls.builtins.diagnostics.flake8.with({
					timeout = 10000,
				}),
				nls.builtins.diagnostics.luacheck.with({
					timeout = 10000,
				}),
				nls.builtins.diagnostics.mypy.with({
					timeout = 10000,
				}),
				nls.builtins.diagnostics.tsc.with({
					extra_filetypes = { "typescriptreact" },
					timeout = 10000,
				}),
			},
		}
	end,
}
