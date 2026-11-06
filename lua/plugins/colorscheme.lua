return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = {
			auto_integrations = true,
			--[[
			integrations = {
				cmp = true,
				treesitter = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
			--]]
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- transparent = true,
			-- highlights = {},
		},
	},
	{
		"ray-x/aurora",
		init = function()
			vim.g.aurora_italic = 1
			vim.g.aurora_transparent = 1
			vim.g.aurora_bold = 1
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		main = "ibl",
		--@module "ibl"
		--@type ibl.config
		opts = {
			--[[
			indent = { highlight = {"CursorColumn", "Whitespace"}, char = "" },
			whitespace = {
				remove_blankline_trail = false,
				highlight = {"CursorColumn", "Whitespace"},
			},
			scope = { enabled = false },
			--]]
		},
	},
}
