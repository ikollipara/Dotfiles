--------------------------------------------
-- lspsaga.lua
-- Ian Kollipara
-- 2023.05.26
--
-- Lsp Saga Configuration
--------------------------------------------

return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		local ks = vim.keymap.set
		require("lspsaga").setup({})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				ks("n", "<leader>cla", ":Lspsaga code_action<cr>", { desc = "Code Action" })
				ks("n", "gp", ":Lspsaga peek_definition<cr>", { desc = "Peek Definition" })
				ks("n", "K", ":Lspsaga hover_doc<cr>", { desc = "Hover" })
			end,
		})
	end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--Please make sure you install markdown and markdown_inline parser
		{ "nvim-treesitter/nvim-treesitter" },
	},
}
