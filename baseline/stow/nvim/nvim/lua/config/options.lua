-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set filetype to apex for .cls and .trigger files
vim.cmd("autocmd BufNewFile,BufRead *.cls,*.trigger set filetype=apex")
vim.api.nvim_set_keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.g.coq_settings = {
	auto_start = "shut-up", -- Automatically start coq_nvim
}
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces

vim.o.foldcolumn = "1" -- Show a fold column
vim.o.foldlevel = 99 -- Start with all folds open
vim.o.foldlevelstart = 99
vim.o.foldenable = true -- Enable folding
vim.o.foldmethod = "manual" -- Let ufo handle the folds
vim.o.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding expressions
