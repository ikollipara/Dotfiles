--[[
-- neo-tree.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Neo-Tree Configuration
--]]

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  keys = {
    {"<leader>pt", desc = "Open File Browser", "<cmd>Neotree toggle<cr>"}
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_default",
    },
    window = {
      mappings = {
        ["<space>"] = nil,
        ["<tab>"] = "toggle_node"
      }
    }
  },
  config = true,
  dependencies = {

    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  }
}

