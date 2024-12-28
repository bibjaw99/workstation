return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			defaults = {
				formatter = "path.filename_first",
				cwd_prompt = false,
				prompt = "> ",
			},
			winopts = {
				height = 0.9,
				width = 0.9,
				row = 0.5,
				col = 0.5,
				preview = {
					wrap = "wrap",
					vertical = "down:50%",
					horizontal = "right:50%",
				},
			},
		})
	end,
}
