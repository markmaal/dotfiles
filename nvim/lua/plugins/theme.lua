local M = {}

function M.kanso()
	return {
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanso-zen")
		end,
	}
end

function M.catppuccin()
	return {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	}
end

function M.tokyonight()
	return {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
		opts = {},
	}
end

return M.kanso()
