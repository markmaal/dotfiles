-- Lazy, we use this to manage plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.print(lazypath)
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

local opts = {}
require("vim-keybinds")
require("vim-options")
require("lazy").setup("plugins")
