------------------------------------------------------------------
-- Ian Kollipara
-- 2023.05.23
--
-- Startup (Dashboard) Configuration
------------------------------------------------------------------

return {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    opts = {
        theme = "startify",
    },
}
