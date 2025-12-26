vim.opt.number = true
vim.opt.linebreak = true -- nice wrap
vim.opt.cursorline = true 
vim.opt.backup = true -- neovim makes backup. to show backup dir - :echo &backupdir
vim.opt.scrolloff = 5 -- more context when scroll (in lines) 

vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.inccommand = 'split'
vim.opt.undofile = true -- save all changes into undofile (:echo &undodir). allows to undo changes between sessions

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.clipboard = 'unnamedplus'

vim.opt.spell = false

vim.opt.spelllang = { 'en_us', 'ru' }

vim.opt.showmatch = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.fixeol = false
vim.opt.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
vim.cmd [[colorscheme wildcharm]]