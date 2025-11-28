-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw (in favor of Oil)
vim.g.netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Tabstop
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Show relative linenumbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mode already visible in statusbar
vim.opt.showmode = false

-- Configure splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indent line wrappings
-- vim.opt.breakindent = true

-- Sync with system clipboard

-- vim.cmd("set clipboard+=unnamedplus")

-- Case-insensitive searching unless /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true

-- Display whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Preview substitutions live
-- vim.opt.inccommand = "split"

-- reduce time for cursorHold
vim.opt.updatetime = 1000
-- Configure Code Folding
--[[
	vim.opt.foldcolumn = "auto"
	vim.opt.foldlevel = 6
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
]]
--
