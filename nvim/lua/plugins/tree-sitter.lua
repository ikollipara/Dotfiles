return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufEnter *.*", "BufNewFile *.*" },
    config = function()
        require("nvim-treesitter.configs").setup({})
    end
}
