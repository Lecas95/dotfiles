return { -- Mason for managing external tools like LSPs
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- nvim-lspconfig for configuring LSP servers
	{ "neovim/nvim-lspconfig" },

	-- mason-lspconfig to integrate Mason with nvim-lspconfig
	{ "williamboman/mason-lspconfig.nvim" },

	-- nvim-treesitter for syntax highlighting and language support
	--{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
	--	require'nvim-treesitter.configs'.setup {
	--		ensure_installed = { "html", "javascript", "apex", "lwc" },  -- Add any languages you need
	--		highlight = { enable = true },
	--	}
	--end },
	-- snippets plugin
	{ "L3MON4D3/LuaSnip" },

	-- nvim-telescope for fuzzy finding files and other utilities
	--{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Additional helpful plugins
	-- { "nvim-tree/nvim-tree.lua" },
	-- { "lewis6991/gitsigns.nvim" },
	{ "kyazdani42/nvim-tree.lua", cmd = "NvimTreeToggle" },
	{
		"xixiaofinland/sf.nvim",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"ibhagwan/fzf-lua", -- no need if you don't use listing metadata feature
		},

		config = function()
			require("sf").setup() -- Important to call setup() to initialize the plugin!
		end,
	},
	{ "AndreM222/copilot-lualine" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{ "elkowar/yuck.vim" },
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		end,
	},
	{ "numToStr/prettierrc.nvim" },
	{
		"mrjones2014/legendary.nvim",
		priority = 1000, -- Load before most plugins
		dependencies = {
			"kkharji/sqlite.lua", -- Optional for persistent history
			"nvim-telescope/telescope.nvim", -- Optional for Telescope integration
		},
		config = function()
			require("legendary").setup({
				include_builtin = true, -- Include built-in keymaps
				include_legendary_cmds = true, -- Include commands defined by Legendary itself
			})
		end,
		keys = {
			{ "<leader>lc", ":Legendary<CR>", desc = "Legendary Command Palette" }, -- Example keybind
		},
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"coffebar/neovim-project",
		opts = {
			projects = { -- define project roots
				"~/Workspace/*",
				"~/.config/*",
			},
			picker = {
				type = "telescope", -- or "fzf-lua"
			},
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			-- optional picker
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
			-- optional picker
			{ "ibhagwan/fzf-lua" },
			{ "Shatur/neovim-session-manager" },
		},
		lazy = false,
		priority = 100,
		keys = {
			{ "<leader>r", ":NeovimProjectDiscover<CR>", desc = "Project List" }, -- Example keybind
		},
	},
	{ "RRethy/vim-illuminate" },
}
