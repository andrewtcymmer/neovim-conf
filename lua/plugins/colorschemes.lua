return {
	{
		"f4z3r/gruvbox-material.nvim",
		name = "gruvbox-material",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.g.gruvbox_material_enable_italic_comment = 1
			require("gruvbox-material").setup({})
			-- vim.cmd.colorscheme 'gruvbox-material'
		end,
	},

	{
		"neanias/everforest-nvim",
		version = false,
		priority = 1000,
		version = false,
		config = function()
			require("everforest").setup({
				background = "soft", -- options: "soft" "medium" "hard". Default is medium.
				ui_contrast = "low", -- options: "high" "low". Default is "low".
			})
		end,
	},

	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
}
