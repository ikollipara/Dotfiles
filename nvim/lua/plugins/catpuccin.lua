return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavor = "mocha",
		integrations = {
			mason = true,
			treesitter = true,
			symbols_outline = true,
			lsp_trouble = true,
			markdown = true,
			telescope = { enable = true },
		},
	},
}
