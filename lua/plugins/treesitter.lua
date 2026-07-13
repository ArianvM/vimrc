return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				-- Highlighting
				vim.treesitter.start()
				-- Folds
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
			end,
		})
		require("nvim-treesitter").install({
			"python",
			"c",
			"cpp",
			"git_config",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"julia",
			"make",
			"markdown",
			"bash",
		})
	end,
}
