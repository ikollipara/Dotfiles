--[[
-- lspconfig.lua
-- Ian Kollipara
-- 2023.03.10
--
-- LSPConfig Configuration
--]]
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    "williamboman/mason.nvim",
    {
      "hrsh7th/cmp-nvim-lsp",
      cond = function()
        return require("core.utils").has("nvim-cmp")
      end,
    },
  },
  opts = {
    servers = {
      lua_ls = {},
      pyright = {},
      texlab = {},
      intelephense = {},
      tsserver = {},
      html = {},
      cssls = {},
    }
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("BufWrite", {
      callback = function()
        vim.lsp.buf.format()
      end
    })
    require("core.utils").onAttach(function(_, _)
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
      vim.keymap.set("n", "<leader>ci", "<cmd>LspInfo<cr>")
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
      vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
      vim.keymap.set("n", "gK", vim.lsp.buf.signature_help)
      vim.keymap.set("i", "<C-l>", vim.lsp.buf.signature_help)
    end)
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local function setup(server)
      local serverOpts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, opts.servers[server] or {})
      require("lspconfig")[server].setup(serverOpts)
    end
    for server, _ in pairs(opts.servers) do
      setup(server)
    end
  end
}
