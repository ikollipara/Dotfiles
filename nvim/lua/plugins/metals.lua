--[[
-- metals.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Metals Configuration
--]]
return {
  'scalameta/nvim-metals',
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "scala", "sbt" },
  config = function()
    local metals = require("metals")
    local config = metals.bare_config()
    config.settings = {
      showImplicitArguments = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }
    config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals.initialize_or_attach(config)
        vim.keymap.set("n", "<leader>C", metals.new_scala_file)
        vim.keymap.set("n", "<leader>T", ":Telescope metals commands<CR>")
      end,
      group = nvim_metals_group,
    })
  end,
}
