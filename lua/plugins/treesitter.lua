return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"c",
			"cpp",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"python",
			"cmake",
		},
		highlight = {
			enable = true,
			disable = {},
		},
	},
}
