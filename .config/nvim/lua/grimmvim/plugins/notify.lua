return {
	"rcarriga/nvim-notify",
	config = function()
		vim.opt.termguicolors = true
		vim.notify = require("notify")

		local notify = require("notify")
		local banned_messages = { "No information available" }

		vim.notify = function(msg, ...)
			for _, banned in ipairs(banned_messages) do
				if msg == banned then
					return
				end
			end
			return require("notify")(msg, ...)
		end

		notify.setup({
			minimum_width = 50,
			background_colour = "#1d2021",
			stages = "fade",
			timeout = 2000,
			fps = 60,
		})
	end,
}
