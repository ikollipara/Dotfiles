--------------------------------------------
-- lsp-lens.lua
-- Ian Kollipara
-- 2023.05.25
--
-- lsp lens configuration
--------------------------------------------

return {
    "VidocqH/lsp-lens.nvim",
    event = { "LspAttach" },
    config = function()
        require("lsp-lens").setup({})

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function()
                vim.cmd("LspLensOn")
            end,
        })
    end,
}
