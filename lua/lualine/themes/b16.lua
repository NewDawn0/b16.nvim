local c = require("b16").cols
return {
	normal = {
		a = { fg = c.base00, bg = c.base0D, gui = "bold" },
		b = { fg = c.base05, bg = "NONE" },
		c = { fg = c.base05, bg = "NONE" },
		x = { fg = c.base05, bg = "NONE" },
		y = { fg = c.base05, bg = "NONE" },
		z = { fg = c.base00, bg = c.base0D, gui = "bold" },
	},
	insert = {
		a = { fg = c.base00, bg = c.base0B, gui = "bold" },
		b = { fg = c.base05, bg = "NONE" },
		c = { fg = c.base05, bg = "NONE" },
		x = { fg = c.base05, bg = "NONE" },
		y = { fg = c.base05, bg = "NONE" },
		z = { fg = c.base00, bg = c.base0B, gui = "bold" },
	},
	visual = {
		a = { fg = c.base00, bg = "NONE", gui = "bold" },
		b = { fg = c.base05, bg = "NONE" },
		c = { fg = c.base05, bg = "NONE" },
		x = { fg = c.base05, bg = "NONE" },
		y = { fg = c.base05, bg = "NONE" },
		z = { fg = c.base00, bg = "NONE", gui = "bold" },
	},
	replace = {
		a = { fg = c.base00, bg = "NONE", gui = "bold" },
		b = { fg = c.base05, bg = "NONE" },
		c = { fg = c.base05, bg = "NONE" },
		x = { fg = c.base05, bg = "NONE" },
		y = { fg = c.base05, bg = "NONE" },
		z = { fg = c.base00, bg = "NONE", gui = "bold" },
	},
	command = {
		a = { fg = c.base00, bg = c.base08, gui = "bold" },
		b = { fg = c.base05, bg = "NONE" },
		c = { fg = c.base05, bg = "NONE" },
		x = { fg = c.base05, bg = "NONE" },
		y = { fg = c.base05, bg = "NONE" },
		z = { fg = c.base00, bg = c.base08, gui = "bold" },
	},
	inactive = {
		a = { fg = c.base00, bg = c.base03, gui = "bold" },
		b = { fg = c.base05, bg = "NONE" },
		c = { fg = c.base05, bg = "NONE" },
		x = { fg = c.base05, bg = "NONE" },
		y = { fg = c.base05, bg = "NONE" },
		z = { fg = c.base00, bg = c.base03, gui = "bold" },
	},
}
