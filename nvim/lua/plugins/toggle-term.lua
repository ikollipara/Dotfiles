--------------------------------------------------
-- toggle-term.lua
-- Ian Kollipara
-- 2023.05.26
--
-- toggle term configuration
--------------------------------------------------

local function toggle_term_select(dir)
	return function()
		vim.ui.select({ "horizontal", "vertical", "tab", "floating" }, {
			prompt = "Which Kind: ",
		}, function(item)
			if item then
				vim.cmd("ToggleTerm dir=" .. dir or "" .. " direction=" .. item)
			end
		end)
	end
end

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({})
		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end,
		})
	end,
	keys = {
		{
			"<leader>ots",
			toggle_term_select(),
			desc = "Open Terminal Select",
		},
		{ "<leader>otg", toggle_term_select("git_dir"), desc = "Open Terminal Select (Git)" },
		{ "<leader>ott", ":ToggleTerm direction=horizontal<cr>", desc = "Open Terminal" },
	},
}
