return {
	-- Install nvim-mapper
	{
		"lazytanuki/nvim-mapper",
		config = function()
			require("nvim-mapper").setup({})
		end,
	},

	-- Example for LazyVim's Telescope Integration
	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			local mapper = require("nvim-mapper")

			-- Add a Telescope picker for searching keymaps
			opts.extensions = opts.extensions or {}
			opts.extensions.mapper = {}
			require("telescope").load_extension("mapper")
		end,
	},
}

