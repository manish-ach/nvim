return {
	"shatur/neovim-ayu",
	config = function()
		require("ayu").setup({
			mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
			terminal = true, -- Set to `false` to let terminal manage its own colors.
			overrides = {},
		})
		vim.cmd("colorscheme ayu")
	end,
}
