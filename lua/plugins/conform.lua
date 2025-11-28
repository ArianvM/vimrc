return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			cpp = { "clang-format" },
			cmake = { "gersemi" },
			["_"] = { "trim_whitespace" },
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
