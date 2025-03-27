-- nvim-treesitter configuration
require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "javascript", "apex" }, -- Removed "lwc" as there is no parser for it
	highlight = { enable = true },
})
