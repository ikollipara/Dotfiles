---------------------------
-- null-ls.lua
-- Ian Kollipara
-- 2023.05.15
--
-- null-ls Configuration
---------------------------

return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
        local nls = require("null-ls")

        return {
            root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
            sources = {
                -- Formatters
                nls.builtins.formatting.black,
                nls.builtins.formatting.codespell,
                nls.builtins.formatting.elm_format,
                nls.builtins.formatting.eslint,
                nls.builtins.formatting.isort,
                nls.builtins.formatting.markdownlint,
                nls.builtins.formatting.markdown_toc,
                nls.builtins.formatting.mdformat,
                nls.builtins.formatting.prettier.with({
                    extra_filetypes = { "typescriptreact" },
                    timeout = 10000,
                }),
                nls.builtins.formatting.stylua,

                -- Code Actions
                nls.builtins.code_actions.eslint,
                nls.builtins.code_actions.proselint,

                -- Completion
                nls.builtins.completion.spell,

                -- Diagnostics
                nls.builtins.diagnostics.flake8,
                nls.builtins.diagnostics.luacheck,
                nls.builtins.diagnostics.mypy,
                nls.builtins.diagnostics.semgrep,
                nls.builtins.diagnostics.tsc,

            }
        }
    end
}
