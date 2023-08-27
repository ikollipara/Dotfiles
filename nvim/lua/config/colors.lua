local M = {}

function M.catppuccin()
	return {
		flavor = "mocha",
		integrations = {
			mason = true,
			treesitter = true,
			symbols_outline = true,
			lsp_trouble = true,
			markdown = true,
			telescope = { enable = true },
		},
	}
end

function M.tokyonight()
	return { style = "night" }
end

return M
