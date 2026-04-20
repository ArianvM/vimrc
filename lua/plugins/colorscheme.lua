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
			highlights = {},
		},
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
