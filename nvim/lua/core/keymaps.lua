----------------------
-- keymaps.lua
-- Ian Kollipara
-- 2023.05.15
--
-- Used Keymaps
----------------------

local M = {}

function M.setup()
    local ks = vim.keymap.set

    ks({ "n" }, "<leader>ws", ":vsplit<cr>")
    ks({ "n" }, "<leader>wS", ":split<cr>")
    ks({ "n", "i", "v" }, "<A-h>", "<C-w>h")
    ks({ "n", "i", "v" }, "<A-j>", "<C-w>j")
    ks({ "n", "i", "v" }, "<A-k>", "<C-w>k")
    ks({ "n", "i", "v" }, "<A-l>", "<C-w>l")
end

return M
