--------------------------
-- init.lua
-- Ian Kollipara
-- 2023.05.15
--
-- Neovim Configuration
--------------------------

local pkg = require("core.pkg-manager")
local settings = require("core.settings")
local keymaps = require("core.keymaps")

settings.setup()
pkg.setup("plugins")
keymaps.setup()
