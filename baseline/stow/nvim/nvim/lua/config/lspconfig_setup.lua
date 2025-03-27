-- lspconfig.lua

-- Ensure Mason is set up first
require("mason").setup()

-- Set up mason-lspconfig
require("mason-lspconfig").setup({
	ensure_installed = { "apex_ls", "lwc_ls", "visualforce_ls" },
})

-- Now set up the LSP servers
local lspconfig = require("lspconfig")
--local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Apex LSP
lspconfig.apex_ls.setup({
	print("Apex LSP setup"),
	root_dir = lspconfig.util.root_pattern("sfdx-project.json"),
	cmd = {
		"java",
		"-Xmx2G",
		"-cp",
		"/home/lecas/.lsp/apex-jorje-lsp.jar",
		"apex.jorje.lsp.ApexLanguageServerLauncher",
	},
	filetypes = { "apex" }, -- Ensure correct filetypes
	on_attach = function(client, bufnr)
		-- Custom on_attach functionality for Apex (e.g., keybindings or formatting)
		print("Apex LSP attached to buffer", bufnr)
		local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	end,
	capabilities = require("blink.cmp").get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities(), -- Use capabilities for LSP
	flags = {
		debounce_text_changes = 150,
	},
})

-- LWC LSP
lspconfig.lwc_ls.setup({
	root_dir = lspconfig.util.root_pattern("sfdx-project.json"),
	on_attach = function(client, bufnr)
		print("LWC LSP attached to buffer", bufnr)
		local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

-- Visualforce LSP
lspconfig.visualforce_ls.setup({
	root_dir = lspconfig.util.root_pattern("sfdx-project.json"),
	on_attach = function(client, bufnr)
		print("visualforce LSP attached to buffer", bufnr)
		local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})
