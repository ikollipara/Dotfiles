--------------------------
-- init.lua
-- Ian Kollipara
-- 2023.05.15
--
-- Neovim Configuration
--------------------------

local netrw = require("core.netrw")
local pkg = require("core.pkg-manager")
local settings = require("core.settings")
local keymaps = require("core.keymaps")

netrw.setup()
settings.setup()
pkg.setup("plugins")
keymaps.setup()
