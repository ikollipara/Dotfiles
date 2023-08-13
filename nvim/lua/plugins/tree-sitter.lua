return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufEnter *.*", "BufNewFile *.*" },
	cond = vim.bo.filetype ~= "astro",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
		})
	end,
}
