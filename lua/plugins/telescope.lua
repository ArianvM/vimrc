return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "https://github.com/BurntSushi/ripgrep" },
	opts = {},
	init = function()
		local builtin = require("telescope.builtin")
		-- Shortcut for searching your neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })

		vim.keymap.set("n", "<leader>siw", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end, { desc = "Search word under cursor" })

		vim.keymap.set("n", "<leader>saw", function()
			builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
		end, { desc = "Search WORD under cursor" })

		vim.keymap.set("n", "<leader>ss", builtin.live_grep, { desc = "Search string" })

		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume Search" })

		vim.keymap.set("n", "<leader>sw", function()
			builtin.find_files({ cwd = "~/workspace/" })
		end, { desc = "Search file in workspace" })
	end,
}
