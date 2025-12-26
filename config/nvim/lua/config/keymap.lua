vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jk', '<Esc>')

-- <leader>d key deletes and don't copy to clipboard
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- move lines with Alt-j/k 
vim.keymap.set('n', '<A-j>', ':m .+1<CR>>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>>==')

vim.keymap.set('n', '<leader>Os', ':set spell!<CR>')

-- disable highliht from search onto Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- AUTOCOMMANDS 

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function() 
		vim.highlight.on_yank()
	end,
})

-- execute bash script 
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.sh",
	callback = function()
		vim.keymap.set('n', '<leader>Oeb', ':w<CR>:!%<CR>')
	end,
})

--execute python script 
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.py",
	callback = function()
		vim.keymap.set('n', '<leader>Oep', ':w<CR>:!python3 %<CR>')
	end,
})