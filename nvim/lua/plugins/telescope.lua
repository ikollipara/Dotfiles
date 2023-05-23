---------------------------------
-- telescope.lua
-- Ian Kollipara
-- 2023.05.15
--
-- 🔭 Telescope Plugin Configuration
---------------------------------

-- set_default_theme
-- Set the default theme for the provided pickers
-- to the provided theme.
--
-- Returns the finished picker table
local function set_default_theme(theme, picker_list)
    local t = {}
    for _, picker in pairs(picker_list) do
        t[picker] = {
            theme = theme
        }
    end
    return t
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim",   build = "make" },
        "nvim-telescope/telescope-symbols.nvim",
        { "nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }
    },
    keys = {
        { "<leader><space>", "<cmd>Telescope find_files<cr>",   desc = "Find Files" },
        { "<leader>pf",      "<cmd>Telescope git_files<cr>",    desc = "Git Files" },
        { "<leader>ff",      "<cmd>Telescope find_files<cr>",   desc = "Find Files" },
        { "<leader>fb",      "<cmd>Telescope buffers<cr>",      desc = "Find Buffers" },
        { "<leader>fs",      "<cmd>Telescope symbols<cr>",      desc = "Find Symbols" },
        { "<leader>fl",      "<cmd>Telescope file_browser<cr>", desc = "File Browser" }
    },
    opts = {
        defaults = {
            prompt_prefix = "󰍉 ",
            selection_caret = "▶ ",
            results_title = "Items",
        },
        pickers = set_default_theme("ivy", { "find_files", "git_files", "symbols", "buffers" }),
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",
            },
            file_browser = {
                theme = "ivy"
            }
        }
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
    end
}
