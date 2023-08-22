return {
	"mhartington/formatter.nvim",
	event = "LspAttach",
	config = function()
		local prettier = require("formatter.defaults").prettier
		local utils = require("formatter.util")
		require("formatter").setup({
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				html = {
					require("formatter.filetypes.html").prettier,
				},
				python = {
					require("formatter.filetypes.python").black,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				astro = {
					prettier("astro"),
				},
				htmldjango = {
					function()
						return {
							exe = "djlint",
							args = {
								"--profile=django",
								"--reformat",
								'--blank-line-after-tag "load,extends,include"',
								"--indent 2",
								"--use-gitignore",
								"-",
							},
							stdin = true,
						}
					end,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				vim.cmd([[FormatWrite]])
			end,
		})
	end,
	keys = {
		{ "<leader>cf", ":FormatWrite<cr>", desc = "Format Code" },
	},
}
