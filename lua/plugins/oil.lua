return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		columns = { "icon" },
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["."] = "actions.select",
			["-"] = false,
			["q"] = "actions.close",
			[","] = "actions.parent",
			["<C-h>"] = false,
			["<M-h>"] = "actions.select_split",
		},
		float = {
			-- Padding around the floating window
			padding = 2,
			max_width = 100,
			max_height = 70,
			border = "rounded",
			win_options = {
				winblend = 20,
			},
			preview_split = "right",

			skip_confirm_for_simple_edits = true,
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},
	},
	keys = {
		{
			"-",
			function()
				require("oil").toggle_float()
			end,
		},
	},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
}
