function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- if theres a background you want to see, uncomment these to make the terminal transparent
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
