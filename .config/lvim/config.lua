-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.termguicolors = true

vim.opt.wrap = true

-- vim.opt.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

lvim.colorscheme = "kanagawa"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "kanagawa",
  callback = function()
    if vim.o.background == "light" then
      vim.fn.system("kitty +kitten themes Kanagawa_light")
    elseif vim.o.background == "dark" then
      vim.fn.system("kitty +kitten themes Kanagawa_dragon")
    else
      vim.fn.system("kitty +kitten themes Kanagawa")
    end
  end,
})

lvim.plugins = {
  --THEMES
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "Shatur/neovim-ayu" },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- your optional config goes here, see below.
    end,
  },
  { "Alexis12119/nightly.nvim" },
  { 'Mofiqul/vscode.nvim' },
  { 'NTBBloodbath/doom-one.nvim' },
  { 'rafalbromirski/vim-aurora' },
  { 'rebelot/kanagawa.nvim' },


  --NOT THEMES
  { 'mg979/vim-visual-multi' },
  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require("ccc")
      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}

-- DAP CONFIGURATION
-- lvim.builtin.dap.active = true
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}
local function getFullPath(relativePath)
  return vim.fn.fnamemodify(vim.fn.expand(relativePath), ":p")
end
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    -- залупа чтоб аргументы считывались когда дебажишь
    args = function()
      local userInput = vim.fn.input('Args: ')
      local args = {}
      for arg in string.gmatch(userInput, "%S+") do
        local file = io.open(getFullPath(arg), "r")
        if file then
          table.insert(args, getFullPath(arg))
          io.close(file)
        else
          table.insert(args, arg)
        end
      end
      return args    end,
  },
}

dap.configurations.c = dap.configurations.cpp
