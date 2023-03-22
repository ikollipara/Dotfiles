--[[
-- auto-tags.lua
-- Ian Kollipara
-- 2023.03.22
--
-- Auto Tags
--]]
return {
	"windwp/nvim-ts-autotag",
	config = true,
	event = "InsertEnter",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("nvim-treesitter.configs").setup({
					autotag = { enable = true },
				})
			end,
		},
	},
}
