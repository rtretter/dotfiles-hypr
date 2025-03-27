return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	config = function()
		local snacks = require("snacks")
		snacks.setup({
			input = {},
		})
	end,
}
