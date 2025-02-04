vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true, desc = "Clear search highlight" })

require("config.lazy")
