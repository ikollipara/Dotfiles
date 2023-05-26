--------------------------------------
-- tabby.lua
-- Ian Kollipara
-- 2023.05.26
--
-- Tabby Configuration
--------------------------------------

return {
    "nanozuki/tabby.nvim",
    event = { "BufRead" },
    config = function()
        require("tabby").setup({})
        require("tabby.tabline").use_preset("tab_with_top_win")
    end,
    keys = {
        { "<leader><Tab>n", ":$tabnew<cr>",  desc = "New Workspace" },
        { "<leader><Tab>d", ":tabclose<cr>", desc = "Close Workspace" },
        { "<leader><Tab>]", ":tabn<cr>",     desc = "Next Workspace" },
        { "<leader><Tab>[", ":tabp<cr>",     desc = "Previous Workspace" },
    },
}
