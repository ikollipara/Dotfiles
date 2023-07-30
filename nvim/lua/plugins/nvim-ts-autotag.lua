return {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufEnter *.{html,astro,tsx}", "BufNewFile *.{html,astro,tsx}" },
    opts = {}
}
