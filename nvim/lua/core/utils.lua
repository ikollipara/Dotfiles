--[[
-- utils.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Utility Functions
--]]

local M = {}

---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

---@param onAttach fun(client, buffer)
function M.onAttach(onAttach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      onAttach(client, buffer)
    end
  })
end

return M
