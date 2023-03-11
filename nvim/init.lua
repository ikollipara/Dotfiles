--[[
-- init.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Neovim Configuration
--]]
vim.g.mapleader = " "
vim.g.localleader = "m"

local lazy = require("modules.lazy")

lazy.setup()
lazy.load_("plugins")
require("core.keymaps")
require("core.options")
