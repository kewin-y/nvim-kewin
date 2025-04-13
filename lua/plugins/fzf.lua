return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
		cmd = { "FzfLua" },
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<CR>", { silent = true }},
        { "<leader>fw", "<cmd>FzfLua live_grep<CR>", { silent = true }},
        { "<leader>fb", "<cmd>FzfLua buffers<CR>", { silent = true }},
        { "<leader>bi", "<cmd>FzfLua<CR>", { silent = true }},
    },
		opts = {
			winopts = {
				border = "single",
				preview = {
					border = "single",
					scrollbar = false,
				},
			},
      hls = {
          backdrop = "FloatBorder"
      },
		},
	},
}
