return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = "BufReadPre",
	cond = vim.bo.filetype ~= "astro",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
