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
