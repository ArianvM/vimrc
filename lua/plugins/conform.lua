return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "black", "autoflake" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			cpp = { "clang_format" },
			c = { "clang_format" },
			java = { "clang_format" },
			cmake = { "cmakelang", "gersemi" },
			json = { "clang_format" },
			["_"] = { "trim_whitespace" },
		},
		formatters = {
			clang_format = {
				prepend_args = {
					"-style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}",
				},
			},
		},
	},

	init = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
	keys = {
		{
			"<leader>fn",
			function()
				require("conform").format()
			end,
		},
	},
}
