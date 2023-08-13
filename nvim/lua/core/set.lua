local M = {}

function M.setup()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "m"
	vim.o.relativenumber = true

	vim.keymap.set({ "n" }, "<leader>ol", ":Lazy<cr>")
	vim.keymap.set("n", "<leader>ws", ":vsplit<cr>")
	vim.keymap.set("n", "<leader>wS", ":split<cr>")
end

return M
