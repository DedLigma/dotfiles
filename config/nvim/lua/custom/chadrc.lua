---@type ChadrcConfig
local M = {}

M.ui = { theme = 'kanagawa' }

vim.opt.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
