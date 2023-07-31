return {
	"mhartington/formatter.nvim",
	event = "LspAttach",
	config = function()
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
