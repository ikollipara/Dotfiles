-------------------------------
-- zen-mode.lua
-- Ian Kollipara
-- 2023.05.15
-- Zen Mode Configuration
-------------------------------

return {
    "folke/zen-mode.nvim",
    dependencies = {
        { 
            "folke/twilight.nvim",
             opts = {
                 dimming = {
                     alpha = 0.3
                 }
             }
         }
    },
    keys = {
        { "<leader>tz", ":ZenMode<cr>" }
    },
    config = true
}
