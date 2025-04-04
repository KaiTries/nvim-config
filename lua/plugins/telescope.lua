return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Fuzzy find files current as parent" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep from recently opened files" })
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Show recently opened files" })

			require("telescope").load_extension("ui-select")
		end,
	},
}
