--------------------------------------
-- one-buddy.lua
-- Ian Kollipara
-- 2023.05.15
--
-- One Dark Colorscheme Configuration
--------------------------------------

return {
    "Th3Whit3Wolf/onebuddy",
    dependencies = { "tjdevries/colorbuddy.nvim" },
    config = function() 
        vim.cmd("colorscheme onebuddy")
    end,
    priority=1000,
}
