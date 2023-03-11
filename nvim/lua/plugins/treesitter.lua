--[[
-- treesitter.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Treesitter Configuration
--]]
return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>",      desc = "Decrement Selection", mode = "x" }
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = {
      "bash",
      "help",
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
