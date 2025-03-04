---@class ColorScheme
---@field cols table<string, string> Table of color hex values
---@field overrides fun(cols: table<string, string>) Function to override default colors

local M = {}

--- Colours class
--- @class Colours
--- @field base00 string -- Background
--- @field base01 string -- Lighter Background
--- @field base02 string -- Selection Background
--- @field base03 string -- Comments, Invisibles
--- @field base04 string -- Dark Foreground
--- @field base05 string -- Default Foreground, Caret
--- @field base06 string -- Light Foreground
--- @field base07 string -- Light Background
--- @field base08 string -- Variables, XML Tags
--- @field base09 string -- Integers, Boolean, Constants
--- @field base0A string -- Classes, Markup Bold
--- @field base0B string -- Strings, Markup Code
--- @field base0C string -- Support, Regular Expressions
--- @field base0D string -- Functions, Methods
--- @field base0E string -- Keywords, Storage
--- @field base0F string -- Deprecated, Opening/Closing Embedded Tags

--- Default configuration table
---@class Config
---@field cols Colours -- The colours
---@field overrides function<Colours> -- Override highlights
M.config = {
	cols = {
		base00 = "#181818",
		base01 = "#282828",
		base02 = "#383838",
		base03 = "#3a4264",
		base04 = "#b8b8b8",
		base05 = "#d8d8d8",
		base06 = "#e8e8e8",
		base07 = "#f8f8f8",
		base08 = "#ff767a",
		base09 = "#ff9268",
		base0A = "#f9d46a",
		base0B = "#80dc7e",
		base0C = "#86c1b9",
		base0D = "#55bcf7",
		base0E = "#da84e4",
		base0F = "#aeabdf",
	},
	overrides = function(cols) end,
}

--- Table of colors
---@type table<string, string>
M.cols = M.config.cols

--- Set highlight groups
---@param groups string[] List of highlight groups
---@param opts table Highlight options (fg, bg, etc.)
M.setHl = function(groups, opts)
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

--- Apply the color scheme to different UI elements
M.apply = function()
	local c = M.cols
	-- Remove bg
	M.setHl({
		"Normal",
		"NormalFloat",
		"SignColumn",
		"Statusline",
	}, { fg = c.base05, bg = "NONE" })
	-- Borders
	M.setHl({
		"FloatBorder",
		"WinSeparator",
		"VertSplit",
		"Border",
	}, { fg = c.base0D, bg = "NONE", bold = true })
	-- Diffs
	M.setHl({ "@diff.minus", "DiffDelete" }, { fg = c.base08 })
	M.setHl({ "@diff.delta", "DiffChange" }, { fg = c.base0D })
	M.setHl({ "@diff.plus", "DiffAdd" }, { fg = c.base0B })
	-- Line nrs
	M.setHl({ "LineNr" }, { fg = c.base0D, bold = true })
	M.setHl({ "LineNrAbove", "LineNrBelow" }, { fg = c.base03 })
	-- Diagnostics
	M.setHl({ "DiagnosticError" }, { fg = c.base08 })
	M.setHl({ "DiagnosticWarn" }, { fg = c.base0A })
	M.setHl({ "DiagnosticInfo" }, { fg = c.base0B })
	M.setHl({ "DiagnosticHint" }, { fg = c.base0C })
	-- Other
	M.setHl({ "MoreMsg", "Directory", "Question" }, { fg = c.base0D })
	M.setHl({ "StatusLine" }, { bg = c.base02 })
	-- Vim syntax highlighting
	M.setHl({ "Comment" }, { fg = c.base03, italic = true })
	M.setHl({ "Delimiter" }, { fg = c.base04 })
	M.setHl({ "Operator" }, { fg = c.base05 })
	M.setHl({ "Identifier" }, { fg = c.base08 })
	M.setHl({ "Constant", "Number" }, { fg = c.base09 })
	M.setHl({ "Type" }, { fg = c.base0A, italic = true })
	M.setHl({ "String" }, { fg = c.base0B })
	M.setHl({ "PreProc" }, { fg = c.base0C })
	M.setHl({ "Function" }, { fg = c.base0D })
	M.setHl({ "Keyword", "Statement", "Special" }, { fg = c.base0E })
	-- Treesitter syntax highlighting
	M.setHl({ "@variable" }, { fg = c.base08 })
	M.setHl({ "@comment.note" }, { fg = c.base06 })
	-- loader.nvim
	M.setHl({ "loaderheader" }, { fg = c.base0E })
	M.setHl({ "loaderloaded" }, { fg = c.base0B })
	M.setHl({ "loadernotLoaded" }, { fg = c.base08 })
	M.setHl({ "loaderinfo" }, { fg = c.base0C })
	-- telescope.nvim
	M.setHl({ "TelescopeTitle", "TelescopeBorder" }, { fg = c.base0D, bg = "NONE" })
	M.setHl({ "TelescopePromptTitle", "TelescopePromptBorder" }, { fg = c.base0E, bg = "NONE" })
	M.setHl({ "TelescopePreviewTitle", "TelescopePreviewBorder" }, { fg = c.base09, bg = "NONE" })
	M.setHl({ "TelescopeMatching" }, { fg = c.base09 })
	M.setHl({ "TelescopePreviewLink" }, { fg = c.base0C })
	-- gitsigns.nvim
	M.setHl({ "GitSignsAdd", "GitSignsUntracked" }, { fg = c.base0B })
	M.setHl({ "GitSignsChange" }, { fg = c.base0D })
	M.setHl({ "GitSignsDelete" }, { fg = c.base09 })
	-- nvim-notify
	M.setHl({ "NotifyERRORBorder", "NotifyERRORIcon", "NotifyERRORTitle" }, { fg = c.base08, bg = "NONE" })
	M.setHl({ "NotifyWARNBorder", "NotifyWARNIcon", "NotifyWARNTitle" }, { fg = c.base0A, bg = "NONE" })
	M.setHl({ "NotifyINFOBorder", "NotifyINFOIcon", "NotifyINFOTitle" }, { fg = c.base0B, bg = "NONE" })
	M.setHl({ "NotifyTRACEBorder", "NotifyTRACEIcon", "NotifyTRACETitle" }, { fg = c.base0C, bg = "NONE" })
	-- Buffferline
	M.setHl({ "BufferLineIndicatorSelected" }, { fg = c.base0D })
	-- Ale
	M.setHl({ "ALEErrorSign" }, { fg = c.base08 })
	M.setHl({ "ALEWarningSign" }, { fg = c.base0A })
	-- Flash
	M.setHl({ "FlashBackdrop" }, { fg = c.base03 })
	M.setHl({ "FlashLabel" }, { fg = c.base0F })
	-- Noice
	M.setHl({ "NoiceCmdlineIconInput" }, { fg = c.base08 })
	M.setHl({ "NoiceCmdlineIconLua" }, { fg = c.base08 })
	M.setHl({ "NoiceCmdlinePopupBorderInput" }, { fg = c.base0D })
	M.setHl({ "NoiceCmdlinePopupBorderLua" }, { fg = c.base08 })
	M.setHl({ "NoiceCmdlinePopupTitleInput" }, { fg = c.base08 })
	M.setHl({ "NoiceCmdlinePopupTitleLua" }, { fg = c.base08 })
	-- Apply overrides
	M.config.overrides(M.config.cols)
end

--- Setup function for configuring the color scheme
---@param opts any|Config? Optional user-defined configuration
M.setup = function(opts)
	M.config = vim.tbl_deep_extend("keep", opts or {}, M.config)
	M.apply()
end

return M
