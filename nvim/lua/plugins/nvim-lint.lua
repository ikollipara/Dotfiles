-- https://github.com/mfussenegger/nvim-lint
return {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    config = function()
        require("lint")
        require("lint").linters_by_ft = {
            lua = { "luacheck", }
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end
        })
    end
}
