return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		-- map jsonc → json AFTER treesitter loads
		vim.treesitter.language.register("json", "jsonc")
	end,
}
