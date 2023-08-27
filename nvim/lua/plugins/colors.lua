return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = require("config.colors").catppuccin(),
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = require("config.colors").tokyonight(),
	},
}
