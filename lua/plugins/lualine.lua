return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons',  "folke/trouble.nvim"},
	opts = {
		-- +-------------------------------------------------+
		-- | A | B | C                             X | Y | Z |
		-- +-------------------------------------------------+
		options = {
			theme = "auto",
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff' },
			lualine_c = { 'diagnostics' },
			lualine_x = { 'filename' },
			lualine_y = { 'datetime' },
			lualine_z = { 'lsp_status' },
		}
	}
}
