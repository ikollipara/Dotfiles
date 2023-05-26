----------------------------------
-- hop.lua
-- Ian Kollipara
-- 2023.05.26
--
-- Hop Configuration
----------------------------------

return {
    "phaazon/hop.nvim",
    keys = {
        { "f" },
        { "F" },
        { "t" },
        { "T" },
        { "<leader>he", ":HopAnywhere<cr>",  desc = "Hop Anywhere" },
        { "<leader>hl", ":HopLineStart<cr>", desc = "Hop Line" },
        { "<leader>hv", ":HopVertical<cr>",  desc = "Hop Vertical" },
        { "<leader>/",  ":HopPattern<cr>",   desc = "Hop Pattern" },
        { "<leader>hw", ":HopWord<cr>",      desc = "Hop Word" },
    },
    config = function()
        local hop = require("hop")
        hop.setup({})
        local directions = require("hop.hint").HintDirection
        vim.keymap.set("", "f", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, { remap = true })
        vim.keymap.set("", "F", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, { remap = true })
        vim.keymap.set("", "t", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end, { remap = true })
        vim.keymap.set("", "T", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end, { remap = true })
    end,
}
