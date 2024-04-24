-- This plugin gives me the tab like look of all my open buffers.

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
		},
	},
}
