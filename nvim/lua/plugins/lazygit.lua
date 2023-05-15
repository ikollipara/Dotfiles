-------------------------------------
-- lazygit.lua
-- Ian Kollipara
-- 2023.05.15
--
-- LazyGit Integration Configuration
-------------------------------------

return {
    "kdheepak/lazygit.nvim",
    keys = {
        { "<leader>gg", ":LazyGit<cr>" },
        {"<leader>gf", ":LazyGitFilterCurrentFile<cr>" }
    }
}
