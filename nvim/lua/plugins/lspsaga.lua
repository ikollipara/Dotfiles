return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	keys = {
		{ "K", ":Lspsaga hover_doc<cr>", desc = "Lsp Hover Doc" },
		{ "<leader>ccr", ":Lspsaga rename<cr>", desc = "Lsp Rename" },
		{ "<leader>cch", ":Lspsaga incoming_calls<cr>", desc = "Call Heirarchy" },
		{ "<leader>cca", ":Lspsaga code_action<cr>", desc = "Lsp Code Action", mode = { "n", "v" } },
		{ "gd", ":Lspsaga goto_definition<cr>", desc = "Lsp Goto Definition" },
	},
}
