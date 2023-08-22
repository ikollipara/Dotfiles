return {
	"lervag/vimtex",
	event = "VeryLazy",
	ft = "tex",
	config = function()
		vim.cmd([[
            let g:vimtex_view_method = 'zathura'
        ]])
	end,
}
