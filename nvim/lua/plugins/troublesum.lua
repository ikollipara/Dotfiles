return {
	"ivanjermakov/troublesum.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("troublesum").setup()
	end,
}
