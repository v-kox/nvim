-- Syntax highlighting (nvim-treesitter main branch)
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"lua", "python", "scala", "bash", "vim", "vimdoc", "sql",
			"json", "luadoc", "markdown", "markdown_inline",
			"jq", "awk", "tmux",
		})

		-- Highlighting is provided by Neovim core; enable it per buffer.
		-- pcall guards filetypes that have no installed parser.
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
				-- Optional: treesitter folds
				-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- vim.wo.foldmethod = "expr"
				-- Optional (experimental): treesitter indentation
				-- vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
