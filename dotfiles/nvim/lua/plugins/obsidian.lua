return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = { -- Only load this plugin in obsidian vault
		"BufReadPre /home/vzkz/Own_Projects/Digital-Brain/*.md",
		"BufNewFile /home/vzkz/Own_Projects/Digital-Brain/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Digital brain",
				path = "/home/vzkz/Own_Projects/Digital-Brain",
			},
		},
		templates = {
			folder = "./Resources/Templates/",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
	},
}
