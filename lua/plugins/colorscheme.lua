return {
	-- Shortened Github Url
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Make sure to set the color scheme when neovim loads and configures the dracula plugin
		vim.cmd.colorscheme("onedark")
	end,
}
