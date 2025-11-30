-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to down window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })

vim.keymap.set("n", "<Tab>", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Previous buffer" })

-- Clear Highlight search
vim.keymap.set("n", "<C-c>", ":nohlsearch<CR>")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Git keybinds
local function git_root()
	local buf = vim.api.nvim_buf_get_name(0)
	local dir = vim.fs.dirname(buf)
	return vim.fs.root(dir, ".git")
end

vim.keymap.set("n", "<leader>va", function()
	local files = vim.fn.input("Select files: ")
	if files == "" then
		print("Adding .")
		vim.system({ "git", "add", "." }, { cwd = git_root() })
	else
		print("adding" .. files)
		vim.system({ "git", "add", files }, { cwd = git_root() })
	end
end, { desc = "Git add" })

vim.keymap.set("n", "<leader>vc", function()
	local msg = vim.fn.input("Commit message: ")
	if msg == "" then
		print("No valid commit message")
	else
		vim.system({ "git", "commit", "-m", msg }, { cwd = git_root() })
	end
end)
-- Language specific keybinds

-- CPP
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.keymap.set("n", "<leader>cb<CR>", ":!cmake --build build", { desc = "Build" })
	end,
})
