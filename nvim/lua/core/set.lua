local M = {}

function M.setup()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "m"

	vim.keymap.set({ "n" }, "<leader>ol", ":Lazy<cr>")
	vim.keymap.set({ "n", "v", "i" }, "<A-h>", "<C-w>h")
	vim.keymap.set({ "n", "v", "i" }, "<A-j>", "<C-w>j")
	vim.keymap.set({ "n", "v", "i" }, "<A-k>", "<C-w>k")
	vim.keymap.set({ "n", "v", "i" }, "<A-l>", "<C-w>l")
	vim.keymap.set("n", "<leader>ws", ":vsplit<cr>")
	vim.keymap.set("n", "<leader>wS", ":split<cr>")
end

return M
