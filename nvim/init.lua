local lazy = require("core.lazy")

local config = require("core.set")

config.setup()

lazy.setup("plugins")
vim.cmd([[colorscheme catppuccin]])
