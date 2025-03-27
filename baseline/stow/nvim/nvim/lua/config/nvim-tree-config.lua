require("nvim-tree").setup({
	view = {
	  width = 30,
	  side = "left",  -- Change to "right" if you prefer the file tree on the right side
	  auto_resize = true,  -- Adjusts the tree size to fit the screen
	},
	git = {
	  enable = true,  -- Show git status icons (modified, added, etc.)
	},
	filters = {
	  dotfiles = true,  -- Show dotfiles
	},
	auto_close = true,  -- Close the tree when opening a file
  })

  -- Keybinding to toggle the file tree
  vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })