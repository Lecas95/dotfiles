-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Load the plugin configuration
require("config.plugins")

-- Load treesitter configuration
require("config.treesitter")

-- Load LSP configuration
require("config.lspconfig_setup")

-- Load keybindings configuration
require("config.mappings")

-- Load filetree configuration
require("config.nvim-tree-config")

-- Load custom highlights
require("config.code_highlights")

require("config.blink-config")

--load sf configs
require("config.sf-config")

--load lualine configs
require("config.lualine")

--Load copilot configs
require("config.copilot-config")

-- Set filetype to apex for .cls and .trigger files
-- vim.cmd("autocmd BufNewFile,BufRead *.cls,*.trigger set filetype=apex")
-- vim.api.nvim_set_keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.g.coq_settings = {
	auto_start = "shut-up", -- Automatically start coq_nvim
}
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
-- Set filetype to apex for .cls and .trigger files
vim.cmd("autocmd BufNewFile,BufRead *.cls,*.trigger set filetype=apex")
vim.api.nvim_set_keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.g.coq_settings = {
	auto_start = "shut-up", -- Automatically start coq_nvim
}
