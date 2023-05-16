--[[
-- comments.lua
-- Ian Kollipara
-- 2023.05.16
--
-- Comment Plugin
--]]
return {
    "echasnovski/mini.comment",
    version = false,
    keys = {
        { "<C-_>", mode = { "n", "i", "v" } },
    },
    opts = {
        mappings = {
            comment = "<C-_>",
            comment_line = "<C-_><C-_>",
            textobject = "<C-_>"
        }
    },
    config = function(_, opts)
        require("mini.comment").setup(opts)
    end
}
