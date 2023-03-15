--[[
-- mapper.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Mapper Module
--]]
local M = {}

---@class KeyTable
---@field lhs string
---@field rhs string|function

---@param mode "n"|"i"|"v"|"t"
local function map(mode)
  ---@param lhs string
  ---@param rhs string|function
  return function(lhs, rhs)
    vim.keymap.set(mode, lhs, rhs)
  end
end

local nmap = map("n")
local imap = map("i")
local vmap = map("v")
local tmap = map("t")

---Setup Normal Keybindings
---@param t KeyTable[]
function M.normal(t)
  for _, mapping in ipairs(t) do
    nmap(mapping.lhs, mapping.rhs)
  end
end

---Setup Insert Keybindings
---@param t KeyTable[]
function M.insert(t)
  for _, mapping in ipairs(t) do
    imap(mapping.lhs, mapping.rhs)
  end
end

---Setup Visual Keybindings
---@param t KeyTable[]
function M.visual(t)
  for _, mapping in ipairs(t) do
    vmap(mapping.lhs, mapping.rhs)
  end
end

function M.term(t)
  for _, mapping in ipairs(t) do
    tmap(mapping.lhs, mapping.rhs)
  end
end

return M
