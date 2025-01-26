local M = {}

M.defaults = {
	cols = {
		base00 = "#181818", -- Background
		base01 = "#282828", -- Lighter Background
		base02 = "#383838", -- Selection Background
		base03 = "#3a4264", -- Comments, Invisibles
		base04 = "#b8b8b8", -- Dark Foreground
		base05 = "#d8d8d8", -- Default Foreground, Caret
		base06 = "#e8e8e8", -- Light Foreground
		base07 = "#f8f8f8", -- Light Background
		base08 = "#ff767a", -- Variables, XML Tags
		base09 = "#ff9268", -- Integers, Boolean, Constants  TODO:
		base0A = "#f9d46a", -- Classes, Markup Bold
		base0B = "#80dc7e", -- Strings, Markup Code
		base0C = "#86c1b9", -- Support, Regular Expressions  TODO:
		base0D = "#55bcf7", -- Functions, Methods
		base0E = "#da84e4", -- Keywords, Storage
		base0F = "#a16946", -- Deprecated, Opening/Closing Embedded Tags  TODO:
	},
}

local function setHl(groups, opts)
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

M.apply = function()
	local c = M.defaults.cols
	-- Remove bg
	setHl({
		"Normal",
		"NormalFloat",
		"SignColumn",
		"Statusline",
	}, { fg = c.base05, bg = "NONE" })
	-- Borders
	setHl({
		"FloatBorder",
		"WinSeparator",
		"VertSplit",
		"Border",
	}, { fg = c.base0D, bg = "NONE", bold = true })
	-- Line nrs
	setHl({ "LineNr" }, { fg = c.base0D, bold = true })
	setHl({ "LineNrAbove", "LineNrBelow" }, { fg = c.base03 })
	-- Vim syntax highlighting
	setHl({ "Comment" }, { fg = c.base03, italic = true })
	setHl({ "Delimiter" }, { fg = c.base04 })
	setHl({ "Operator" }, { fg = c.base05 })
	setHl({ "Identifier" }, { fg = c.base08 })
	setHl({ "Constant", "Number" }, { fg = c.base09 })
	setHl({ "Type" }, { fg = c.base0A, italic = true })
	setHl({ "String" }, { fg = c.base0B })
	setHl({ "PreProc" }, { fg = c.base0C })
	setHl({ "Function" }, { fg = c.base0D })
	setHl({ "Keyword", "Statement", "Special" }, { fg = c.base0E })
	-- Treesitter syntax highlighting
	setHl({ "@variable" }, { fg = c.base08 })
	setHl({ "@comment.note" }, { fg = c.base06 })
end

M.setup = function(opts)
	M.defaults = vim.tbl_deep_extend("keep", opts or {}, M.defaults)
	M.apply()
end

return M
