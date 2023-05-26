------------------------------------------------------------
-- indent-blankline.lua
-- Ian Kollipara
-- 2023.05.25
--
-- Indent Blankline Configuration
------------------------------------------------------------

return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    opts = {
        show_current_context = true,
        show_current_context_start = true,
    },
}
