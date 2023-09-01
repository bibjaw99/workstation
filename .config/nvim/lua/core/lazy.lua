local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--Dash Board
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Vim Notification Popup
	{ "rcarriga/nvim-notify" },

	-- Auto Formatting
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- Commnets Plugins
	{ "numToStr/Comment.nvim" },

	-- Colorscheme
	{ "gruvbox-community/gruvbox" },
	{ "sainnhe/gruvbox-material" },

	-- For Transparency
	{ "xiyaowong/transparent.nvim" },

	-- Rainbos CSV
	{ "mechatroner/rainbow_csv" },

	-- Colorizer.lua
	{ "norcalli/nvim-colorizer.lua" },

	-- Terminal
	{ "akinsho/toggleterm.nvim" },

	-- Indent Line
	{ "lukas-reineke/indent-blankline.nvim" },

	-- GitSign Plugins
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "bufWinEnter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- nvim-ts-autotag
	{ "windwp/nvim-ts-autotag" },

	-- Nvim treesitter rainbow brackets
	{ "hiphish/rainbow-delimiters.nvim" },

	-- nvim autopairs
	{ "windwp/nvim-autopairs" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "kdheepak/lazygit.nvim" },
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	-- NeoVIMTree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Buffer Line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Lua Line
	{ "nvim-lualine/lualine.nvim" },

	-- WhichKey
	{ "folke/which-key.nvim" },

	-- Auto Completion
	{ "hrsh7th/nvim-cmp" }, -- cmp Completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completion
	{ "hrsh7th/cmp-path" }, -- path completion
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" }, -- command line Completion

	{ "saadparwaiz1/cmp_luasnip" },
	-- Snipit Engine
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	-- Lsp Saga
	{ "glepnir/lspsaga.nvim" },

	-- lspkind for icons with snipits
	{ "onsails/lspkind.nvim" },

	-- Managing Mason
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	-- emmet
	{ "mattn/emmet-vim" },

	-- lorem ipsum
	{ "derektata/lorem.nvim" },

	-- Neovim Tagbar
	{ "preservim/tagbar" },
	-- ==============================================================
} -- end of plugin line

local opts = {}
require("lazy").setup(plugins, opts)
