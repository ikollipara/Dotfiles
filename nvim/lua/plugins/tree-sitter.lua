-------------------------------
-- tree-sitter.lua
-- Ian Kollipara
-- 2023.05.15
--
-- Tree Sitter Configuration
-------------------------------

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "mrjones2014/nvim-ts-rainbow",
        "windwp/nvim-ts-autotag"
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>",      desc = "Decrement Selection", mode = "x" }
    },
    opts = {
        highlight = { enable = true },
        rainbow = { enable = true, extended_mode = true },
        indent = { enable = true, disable = { "python" } },
        autotag = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
            "bash",
            "html",
            "javascript",
            "json",
            "lua",
            "luap",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml",
            "php"
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<nop>",
                node_decremental = "<bs>",
            },
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
