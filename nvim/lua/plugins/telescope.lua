return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
	keys = {
		{ "<leader><space>", ":Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fb", ":Telescope buffers<cr>", desc = "Find Buffers" },
		{ "<leader>ft", ":Telescope treesitter<cr>", desc = "List Symbols" },
	},
}
