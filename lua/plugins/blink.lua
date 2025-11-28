return {
	"saghen/blink.cmp",
	event = "VimEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		"folke/lazydev.nvim",
	},
	build = "cargo build --release",
	opts = {
		keymap = {
			preset = "default",
			["<C-z>"] = { "accept" },
		},
		completion = {
			ghost_text = {
				enabled = true,
			},
			menu = { auto_show = false },

			keyword = {
				range = "prefix",
			},
		},
		sources = {

			default = { "lsp", "path", "snippets", "buffer" },

			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		snippets = {
			preset = "luasnip",
		},
	},
}
