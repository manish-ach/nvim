-- init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- Setup lazy.nvim
require("lazy").setup("plugins")

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end

-- load theme
require("nvconfig").base46.theme = "kanagawa"
require("base46").load_all_highlights()

-- load configs
require("config.lsptoggle")
require("config.keymaps")
require("config.options")
