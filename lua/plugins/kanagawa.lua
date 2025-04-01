return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			theme = "dragon",
			compile = true,
			background = {
				dark = "wave",
				light = "lotus",
			},
			overrides = function(colors)
				local theme = colors.theme
				local c = require("kanagawa.lib.color")

				-- Helper function to create diagnostic colors
				local function makeDiagnosticColor(color)
					return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
				end

				return {
					-- Markdown syntax highlighting
					["@markup.link.url.markdown_inline"] = { link = "Special" },
					["@markup.link.label.markdown_inline"] = { link = "WarningMsg" },
					["@markup.italic.markdown_inline"] = { link = "Exception" },
					["@markup.raw.markdown_inline"] = { link = "String" },
					["@markup.list.markdown"] = { link = "Function" },
					["@markup.quote.markdown"] = { link = "Error" },
					["@markup.list.checked.markdown"] = { link = "WarningMsg" },

					-- Floating Windows
					NormalFloat = { bg = theme.ui.bg_p1 },
					FloatBorder = { bg = theme.ui.bg_p1 },
					FloatTitle = { bg = theme.ui.bg_p1 },

					-- Darker UI for some floating windows
					NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
					LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

					-- Popup Menu Customization
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },

					-- Diagnostic Virtual Text
					DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
					DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
					DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
					DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
				}
			end,
		})
		vim.cmd("colorscheme kanagawa")
	end,
	build = function()
		vim.cmd("KanagawaCompile")
	end,
}
