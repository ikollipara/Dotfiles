--[[
-- keymaps.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Extra Keymaps
--]]
local mapper = require("modules.mapper")


vim.keymap.set({ "n", "i", "v" }, "<M-h>", function() vim.cmd.winc("h") end)
vim.keymap.set({ "n", "i", "v" }, "<M-j>", function() vim.cmd.winc("j") end)
vim.keymap.set({ "n", "i", "v" }, "<M-k>", function() vim.cmd.winc("k") end)
vim.keymap.set({ "n", "i", "v" }, "<M-l>", function() vim.cmd.winc("l") end)

vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]
vim.cmd [[:tnoremap <C-t> <cmd>lua require("nvterm.terminal").toggle("horizontal")<cr>]]

mapper.normal {
  { lhs = "<leader>S", rhs = vim.cmd.split },
  { lhs = "<leader>s", rhs = vim.cmd.vsplit },
}

mapper.visual {
  { lhs = "J", rhs = ":m '>+1<CR>gv=gv" },
  { lhs = "K", rhs = ":m '<-2<CR>gv=gv" },
}
