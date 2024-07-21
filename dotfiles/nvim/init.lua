-- Added configuration:
-- Theme: Catppuccin
-- Telescope: fuzzy finder
-- Treesitter: creates an abstract tree of the code that makes it easy to highlight it (among other things)
-- Neotree: tree-structured project on the side
-- lualine: status bar

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.number = true

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
]])

require("config.lazy")


