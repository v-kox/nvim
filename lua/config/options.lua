-- set colorscheme
vim.cmd 'colorscheme catppuccin-mocha'

-- Pointing to specific executables for Nodejs and Python3
vim.g.node_host_prog = '/home/vincent/.local/node-v23.2.0-linux-x64/bin/neovim-node-host'
vim.g.python3_host_prog = '/usr/bin/python3'

-- autoformat text
vim.g.autoformat = true

vim.opt.swapfile = false -- disable swp files

-- vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Use spaces instead of tabs

vim.opt.showmatch = true -- show matching braces

vim.opt.autoindent = true

vim.opt.wrap = false -- Do not wrap lines

vim.opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.ruler = true -- show ruler with row and columnnumber on statusline
vim.opt.cursorline = true -- highlight the current line
vim.opt.ignorecase = true -- Ignore case sensitivity in searches e.a.
vim.opt.list = true -- Show some invisible characters

vim.opt.splitright = true -- Horizontal split to the right
vim.opt.splitbelow = true -- Vertical split below

vim.opt.termguicolors = true -- Enable terminal colors

vim.opt.laststatus = 3

vim.wo.number = true -- Show current line number as actual line number
vim.wo.relativenumber = true -- Show other lines as relative line number
