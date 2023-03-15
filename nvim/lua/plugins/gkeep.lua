--[[
-- gkeep.lua
-- Ian Kollipara
-- 2023.03.14
--
-- Google Keep Integration
--]]
return {
  "stevearc/gkeep.nvim",
  build = "UpdateRemotePlugins",
  cond = false,
  lazy = false,
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      config = function()
        require("telescope").load_extension("gkeep")
      end
    },
  },
  keys = {
    { "<leader>no", "<cmd>Telescope gkeep<cr>" },
    { "<leader>nn", function()
      vim.ui.select({ "list", "note" }, { prompt = "Select Type of Note: " },
        function(item)
          if item ~= nil then
            vim.ui.input({ prompt = "Enter Name of Note: " },
              function(input) if input ~= nil then vim.cmd("GkeepNew " .. item .. " " .. input) end end)
          end
        end)
    end } },
}
