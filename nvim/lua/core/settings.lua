---------------------
-- settings.lua
-- Ian Kollipara
-- 2023.05.15
--
-- Neovim Defaults
---------------------

local M = {}

function M.setup() 
    vim.g.mapleader = " "
    vim.opt.number = true
    vim.opt.signcolumn = "yes"
    vim.opt.incsearch = true
    vim.opt.termguicolors = true
    vim.opt.wrap = true
    vim.keymap.set({"n", "i", "v"}, "<C-g>", "<ESC>")
end

return M

