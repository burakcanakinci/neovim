function ColorMyPencils(color)
	color = color or "palenightfall"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "light" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "light" })

end
