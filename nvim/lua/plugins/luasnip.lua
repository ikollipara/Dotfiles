--[[
-- luasnip.lua
-- Ian Kollipara
-- 2023.03.10
--
-- LuaSnip Configuration
--]]

return {
  "L3MON4D3/LuaSnip",
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
		require("luasnip").config.set_config({
			-- Setting LuaSnip config

			-- Enable autotriggered snippets
			enable_autosnippets = true,
			-- Use Tab (or some other key if you prefer) to trigger visual selection
			store_selection_keys = "<Tab>",
		})
	end,
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
