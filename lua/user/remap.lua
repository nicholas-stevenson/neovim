-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
--map("n", "<Leader>", ":<C-u>WhichKey ','<CR>" { silent = true })
--map("n", "<Leader>?", ":WhichKey ','<CR>")
--map("n", "<Leader>a", ":cclose<CR>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>R", ":!cargo run<CR>")

-- Remaps the Ctrl+W + h/j/k/l keys, which moves your cursor
-- the particular window splits, to just Ctrl+h/j/k/l
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-L>", "<C-W>l")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
