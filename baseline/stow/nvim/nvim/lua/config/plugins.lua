-- plugins.lua

-- Install plugins using lazy.nvim
require("lazy").setup({
    -- Mason for managing external tools like LSPs
    { "williamboman/mason.nvim", config = function() require("mason").setup() end },
    
	-- nvim-lspconfig for configuring LSP servers
    { "neovim/nvim-lspconfig" },

    -- mason-lspconfig to integrate Mason with nvim-lspconfig
    { "williamboman/mason-lspconfig.nvim" },


    -- nvim-treesitter for syntax highlighting and language support
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "html", "javascript", "apex", "lwc" },  -- Add any languages you need
            highlight = { enable = true },
        }
    end },

    -- nvim-cmp for auto-completion
    { "hrsh7th/nvim-cmp" },

    -- completion sources for LSP and other plugins
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
	{ 'saadparwaiz1/cmp_luasnip' }, -- Snippet completion source

    -- snippets plugin
    { "L3MON4D3/LuaSnip" },

    -- nvim-telescope for fuzzy finding files and other utilities
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Additional helpful plugins
    -- { "nvim-tree/nvim-tree.lua" },
    -- { "lewis6991/gitsigns.nvim" },
	{ "kyazdani42/nvim-tree.lua", cmd = "NvimTreeToggle" },
})
