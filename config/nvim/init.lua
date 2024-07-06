vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

vim.wo.number = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4


require("plugin_manager")
local plugins = require("plugins")
require("lazy").setup(plugins, opts)


require("mapping")

require("lang_config")



-- vim.g.clipboard += 'unnamedplus'

-- vim.opt.background = 'dark'
-- vim.g.colors_name = 'onedark'
-- require('doom').set()
