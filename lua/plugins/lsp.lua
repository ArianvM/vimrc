return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },

		"neovim/nvim-lspconfig",
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					-- Vim
					"vimls",
					-- Lua
					"lua_ls",
					"stylua",
					-- Python
					"pyright",
					"pyrefly",
					"isort",
					"black",
					-- C++
					"clangd",
					"clang-format",
					"cmake",
					"codelldb",
				},
			},
		},
		"saghen/blink.cmp",
	},
	opts = function(_, _)
		-- vim.list_extend(opts.servers, servers)
		vim.lsp.config("*", {
			root_markers = { ".git" },
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.config("julials", {
			cmd = {
				"julia",
				"--project=" .. "~/.julia/environments/nvim-lspconfig/",
				"--startup-file=no",
				"--history-file=no",
				"-e",
				[[
					using Pkg
					Pkg.instantiate()
					using LanguageServer
				depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
				project_path = let
					dirname(something(
						## 1. Finds an explicitly set project (JULIA_PROJECT)
						Base.load_path_expand((
							p = get(ENV, "JULIA_PROJECT", nothing);
								p === nothing ? nothing : isempty(p) ? nothing : p
							)),
								## 2. Look for a Project.toml file in the current working directory,
								##    or parent directories, with $HOME as an upper boundary
								Base.current_project(),
								## 3. First entry in the load path
								get(Base.load_path(), 1, nothing),
								## 4. Fallback to default global environment,
								##    this is more or less unreachable
							Base.load_path_expand("@v#.#"),
						))
					end
							@info "Running language server" VERSION pwd() project_path depot_path
							server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
				server.runlinter = true
					run(server)
				]],
			},
			filetypes = { "julia" },
			root_markers = { "Project.toml", "JuliaProject.toml" },
			settings = {},
		})
		vim.lsp.enable("julials")
	end,
	init = function()
		local builtin = require("telescope.builtin")

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
			callback = function(event)
				vim.cmd("TSEnable highlight")

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gr", builtin.lsp_references, "List References")
				map("gd", builtin.lsp_definitions, "Goto Definition")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gs", builtin.lsp_document_symbols, "Goto document symbols")
				map("gS", builtin.lsp_workspace_symbols, "Goto workspace symbols")
				map("gi", builtin.lsp_implementations, "Goto implementations")
				map("se", builtin.diagnostics, "Show Diagnostics")
				map("<leader>e", vim.diagnostic.open_float, "float diagnostic")
				map("K", vim.lsp.buf.hover, "Hover information")
				map("<leader>h", vim.lsp.buf.signature_help, "Signature Help")
				map("<leader>ca", vim.lsp.buf.code_action, "Code actions")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>lr", ":lsp restart<CR>", "Restart LSP")

				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					callback = function()
						local bufnr = vim.api.nvim_get_current_buf()
						for _, client in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
							if client.server_capabilities.documentHighlightProvider then
								vim.lsp.buf.document_highlight()
							end
						end
					end,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					callback = function()
						for _, client in pairs(vim.lsp.get_clients({ bufnr = event.buf })) do
							if client.server_capabilities.documentHighlightProvider then
								vim.lsp.buf.clear_references()
							end
						end
					end,
				})
			end,
		})
	end,
}
