--------------------------------------------------------------
-- nvim-tree.lua
-- Ian Kollipara
-- 2023.05.18
--
-- Nvim Tree Package Configuration
--------------------------------------------------------------

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        vim.api.nvim_create_autocmd({ "BufReadPost" }, {
            callback = function()
                vim.cmd("NvimTreeFindFile")
            end
        })
        local function find_directory_and_focus()
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local function open_nvim_tree(prompt_bufnr, _)
                actions.select_default:replace(function()
                    local api = require("nvim-tree.api")

                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    api.tree.open()
                    api.tree.find_file(selection.cwd .. "/" .. selection.value)
                end)
                return true
            end

            require("telescope.builtin").find_files({
                find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git/*" },
                attach_mappings = open_nvim_tree,
            })
        end

        vim.keymap.set("n", "<leader>fd", find_directory_and_focus, { desc = "Find Directory" })
    end,
    lazy = false,
    keys = {
        { "<leader>pt", "<cmd>NvimTreeToggle<cr>", desc = "Open Nvim Tree" }
    }
}
