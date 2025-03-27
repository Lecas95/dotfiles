-- blink-config.lua

local blink = require("blink.cmp")

blink.setup({
    -- Specify sources for autocompletion
    sources = {
        { name = "nvim_lsp" }, -- LSP completions
        { name = "path" },     -- Path completions
        { name = "buffer" },   -- Buffer completions
    },
    -- Key mappings
    keymaps = {
        complete = "<C-Space>", -- Trigger completion
        confirm = "<CR>",       -- Confirm selection
        prev_item = "<S-Tab>",  -- Previous item
        next_item = "<Tab>",    -- Next item
    },
})
