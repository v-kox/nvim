return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{"<leader>ff", "<cmd>Telescope find_files<cr>", desc="Find files"},
		{"<leader>fg", "<cmd>Telescope git_files<cr>", desc="Find Git files"},
        {"<leader>fw", "<cmd>Telescope live_grep<cr>", desc="Find in files"},
	},
	opts = function(_, _)
		require("telescope").setup()
	end,
}

