-----------------------------------------------
-- nvterm.lua
-- Ian Kollipara
-- 2023.05.15
--
-- NvChad's Terminal Integration Configuration
-----------------------------------------------

return {
    "NvChad/nvterm",
    config = function(_, opts)
        require("nvterm").setup(opts)
        vim.keymap.set({"n", "i", "v", "t"}, "<ESC>", "<C-\\><C-n>")
    end,
    keys = {
        {"<leader>ot", function() require("nvterm.terminal").toggle("horizontal") end },
        {"<leader>oT", function() require("nvterm.terminal").new("horizontal") end    },
        { "<ESC>", "<C-\\><C-n>", { "n", "i", "v", "t" } },
    }
}
