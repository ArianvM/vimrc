return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" },
	opts = function()
		local opts = {
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},

			-- +-------------------------------------------------+
			-- | A | B | C                             X | Y | Z |
			-- +-------------------------------------------------+
			sections = {
				lualine_a = { "branch", "diff" },
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = { { "diagnostics", sources = { "nvim_workspace_diagnostic" } } },
				lualine_y = { "mode" },
				lualine_z = { "lsp_status" },
			},
		}

		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			-- The following line is needed to fix the background color
			-- Set it to the lualine section you want to use
			hl_group = "lualine_c_normal",
		})

		local get_symbols = symbols.get
		symbols.get = function()
			local s = get_symbols()
			return (s:gsub("%%%*", "%%#lualine_c_normal#"))
		end

		table.insert(opts.sections.lualine_c, {
			symbols.get,
			cond = symbols.has,
		})
		return opts
	end,
}
