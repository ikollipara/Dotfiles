--[[
-- telescope.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Telescope Configuration
--]]
return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
}
