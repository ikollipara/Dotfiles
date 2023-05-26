--------------------------------------------------------------
-- which-key.lua
-- Ian Kollipara
-- 2023.05.18
--
-- Which Key Package Configuration
--------------------------------------------------------------

return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require("which-key")
        wk.setup({
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<Tab>"] = "TAB",
        })
        wk.register({
            ["<leader><Tab>"] = {
                name = "+workspace",
            },
            ["<leader>f"] = {
                name = "+telescope",
            },
            ["<leader>h"] = {
                name = "+hop",
            },
            ["<leader>p"] = {
                name = "+project",
            },
            ["<leader>b"] = {
                name = "+buffer",
                d = { "<cmd>bd<cr>", "Delete Buffer" },
            },
            ["<leader>w"] = {
                name = "+window",
                d = { "<C-w>q", "Delete Window Split" },
                s = { "<cmd>vsplit<cr>", "Split Window Vertically" },
                S = { "<cmd>split<cr>", "Split Window Horizontally" },
            },
            ["<leader>t"] = {
                name = "+toggle",
            },
            ["<leader>o"] = {
                name = "+open",
                ["-"] = {
                    function()
                        vim.cmd("NvimTreeFocus")
                        vim.cmd("only")
                    end,
                    "Open NvimTree as a Buffer",
                },
                ["t"] = {
                    name = "+terminal",
                },
            },
            ["<leader>c"] = {
                name = "+code",
                l = {
                    name = "+lsp",
                },
            },
        })
    end,
}
