--[[
-- knap.lua
-- Ian Kollipara
-- 2023.03.15
--
-- Knap Configuration
--]]
return {
  "frabjous/knap",
  config = function()
    vim.cmd [[
    let g:knap_settings = {
      \ "textopdfviewerlaunch": "evince %outputfile%",
      \ "textopdfviewerrefresh": "none",
      \ "textopdfforwardjump" : "synctex view -i %line%:%column%:%srcfile% -o %outputfile% -x 'evince -i %{page+1} %outputfile%'",
      \ "textopdfbufferasstdin": v:true
    \ }
    ]]
  end,
  keys = {
    { "<F7>", function() require("knap").toggle_autopreviewing() end, { "n", "i", "v" } },
    { "<F8>", function() require("knap").forward_jump() end,          { "n", "i", "v" } },
  },
  ft = { "plaintex", "tex" }
}
