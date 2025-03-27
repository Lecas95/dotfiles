-- mappings.lua

-- Example keybinding to open file finder (Telescope)
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })

-- Add more keybindings as needed
--
vim.api.nvim_set_keymap(
	"n",
	"<leader>kk",
	":Telescope mapper<CR>",
	{ noremap = true, silent = true, desc = "Search Keymaps" }
)

vim.api.nvim_set_keymap("n", "<leader>Rp", ":SF currentFile push<CR>", { desc = "Push current file to salesforce" })
