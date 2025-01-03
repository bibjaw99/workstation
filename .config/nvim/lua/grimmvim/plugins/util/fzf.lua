return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			fzf_opts = {
				["--no-scrollbar"] = true,
			},
			defaults = {
				formatter = "path.filename_first",
				cwd_prompt = false,
				prompt = "> ",
				file_icons = true,
			},
			winopts = {
				height = 0.9,
				width = 0.9,
				row = 0.5,
				col = 0.5,
				preview = {
					wrap = "nowrap",
					vertical = "down:50%",
					horizontal = "right:50%",
					scrollbar = false, -- `false` or string:'float|border'
				},
			},
		})
	end,
}
