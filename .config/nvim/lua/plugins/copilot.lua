return {
		"zbirenbaum/copilot.lua",
	config = function()
		local copilot = require("copilot")
		copilot.setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
