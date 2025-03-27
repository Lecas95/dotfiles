return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					apex = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									vim.api.nvim_buf_get_name(0),
									"--plugin",
									"prettier-plugin-apex",
								},
								stdin = true,
							}
						end,
					},
					xml = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									vim.api.nvim_buf_get_name(0),
									"--plugin",
									"prettier-plugin-xml",
								},
								stdin = true,
							}
						end,
					},
				},
			})
		end,
	},
}
