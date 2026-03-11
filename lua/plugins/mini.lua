return {
	{ "nvim-mini/mini.ai", version = "*", opts = {} },
	{
		"nvim-mini/mini.comment",
		version = "*",
		opts = {
			mappings = {
				-- Toggle comment (like `gcip` - comment inner paragraph) for both
				-- Normal and Visual modes
				comment = "<C-k>",

				-- Toggle comment on current line
				comment_line = "<C-k><C-k>",

				-- Toggle comment on visual selection
				comment_visual = "<leader>k",

				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				-- Works also in Visual mode if mapping differs from `comment_visual`
				textobject = "<leader>k",
			},
		},
	},
	{
		"nvim-mini/mini.move",
		version = "*",
		opts = {
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-h>",
				right = "<M-l>",
				down = "<M-j>",
				up = "<M-k>",

				-- Move current line in Normal mode
				line_left = "<M-h>",
				line_right = "<M-l>",
				line_down = "<M-j>",
				line_up = "<M-k>",
			},
		},
	},
	{ "nvim-mini/mini.surround", version = "*", opts = {} },
	{ "nvim-mini/mini.icons" },
	{ "nvim-mini/mini.pairs", opts = {
		mappings = {
			["("] = false,
			['"'] = false,
			["'"] = false,
		},
	} },
}
