local M = {}

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
			vim.cmd.colorscheme("tokyonight")
		end,
		opts = {},
	}
end

return M.tokyonight()
