--[[
-- init.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Neovim Configuration
--]]
vim.g.mapleader = " "
vim.g.localleader = "m"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazy = require("modules.lazy")

lazy.setup()
lazy.load_("plugins")
require("core.keymaps")
require("core.options")
