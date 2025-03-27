-- ~/.config/nvim/lua/config/colors.lua
local set_hl = vim.api.nvim_set_hl

-- Generic Highlight Groups
set_hl(0, "Comment", { fg = "#6eb485", italic = true })
set_hl(0, "String", { fg = "#e4af4d" })
set_hl(0, "Variable", { fg = "#5bcfec" })

-- Specific Highlight Groups
-- Tree-sitter equivalents and custom mappings
set_hl(0, "@property", { fg = "#ffffff" }) -- variable.other.object.property.apex
set_hl(0, "@constant.null", { fg = "#f8771a", italic = true, bold = true }) -- constant.language.null.apex
set_hl(0, "@function.call", { fg = "#8d56f3", italic = true }) -- support.function.apex
set_hl(0, "@keyword.operator.query", { fg = "#8d56f3", italic = true }) -- keyword.operator.query.*.apex
set_hl(0, "@keyword.field", { fg = "#a39ab3", italic = true }) -- keyword.query.field.apex
set_hl(0, "@type", { fg = "#ff5252", bold = true }) -- storage.type.apex, keyword.type.apex
set_hl(0, "@conditional", { fg = "#ff9752", bold = true }) -- keyword.control.loop.for.apex, if.apex, else.apex
set_hl(0, "@field", { fg = "#3168ff", bold = true }) -- entity.name.variable.field.apex
set_hl(0, "@variable.language", { fg = "#ff5252", italic = true, bold = true, strikethrough = true }) -- variable.language.this.js

-- Additional Highlight Groups
set_hl(0, "@property.table", { fg = "#4EC9B0" }) -- support.type.property-name.table
set_hl(0, "@property.array", { fg = "#569CD6" }) -- support.type.property-name.array
set_hl(0, "@constant.time", { fg = "#DCDCAA" }) -- constant.other.time

-- Hook into ColorScheme to reapply these settings dynamically
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Reapply the custom highlights
		vim.api.nvim_set_hl(0, "Comment", { fg = "#6eb485", italic = true })
		vim.api.nvim_set_hl(0, "String", { fg = "#e4af4d" })
		vim.api.nvim_set_hl(0, "Variable", { fg = "#5bcfec" })
		-- Include all other highlight rules here as well...
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "apex", "javascript" }, -- Add your language here
	callback = function()
		vim.api.nvim_set_hl(0, "@variable", { fg = "#5bcfec" })
		vim.api.nvim_set_hl(0, "@property", { fg = "#ffffff" })
	end,
})
