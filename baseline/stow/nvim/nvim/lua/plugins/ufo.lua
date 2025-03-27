return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async", -- Required dependency for nvim-ufo
	},
	config = function()
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				-- Customize provider selector logic if needed
				return { "treesitter", "indent" }
			end,
		})

		-- Optionally, set up keymaps for folding
		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds selectively" })
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds selectively" })
		vim.o.foldmethod = "manual"
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"

		-- Set up LSP capabilities for ufo
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Ensure your LSP client supports foldingRange
		local lspconfig = require("lspconfig")
		for _, server in ipairs({ "pyright", "tsserver", "lua_ls" }) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end
	end,
}
