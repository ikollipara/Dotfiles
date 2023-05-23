--------------------
-- keymaps.lua
-- Ian Kollipara
-- 2023.05.18
--
-- Keymapings
--------------------

local M = {}

local ks = vim.keymap.set

function M.setup()
    ks({ "n", "i", "v" }, "<A-h>", "<C-w>h")
    ks({ "n", "i", "v" }, "<A-j>", "<C-w>j")
    ks({ "n", "i", "v" }, "<A-k>", "<C-w>k")
    ks({ "n", "i", "v" }, "<A-l>", "<C-w>l")
end

return M
