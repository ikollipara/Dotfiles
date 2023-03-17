--[[
-- keymaps.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Extra Keymaps
--]]
require("modules.mapper")
    :normal {
      { lhs = "<leader>S", rhs = vim.cmd.split },
      { lhs = "<leader>s", rhs = vim.cmd.vsplit },
    }
    :visual {
      { lhs = "J", rhs = ":m '>+1<CR>gv=gv" },
      { lhs = "K", rhs = ":m '<-2<CR>gv=gv" },
    }
    :term {
      { lhs = "<Esc>", rhs = "<C-\\><C-n>" },
      { lhs = "<C-t>", rhs = function() require("nvterm.terminal").toggle("horizontal") end }
    }
    :modes { "n", "i", "v" } {
  { lhs = "<M-h>", rhs = function() vim.cmd.winc("h") end },
  { lhs = "<M-j>", rhs = function() vim.cmd.winc("j") end },
  { lhs = "<M-k>", rhs = function() vim.cmd.winc("k") end },
  { lhs = "<M-l>", rhs = function() vim.cmd.winc("l") end },
}
