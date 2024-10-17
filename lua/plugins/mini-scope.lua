return {
	-- Shortened Github Url
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Make sure to set the color scheme when neovim loads and configures the dracula plugin
		require("mini.indentscope").setup()
	end,
}
