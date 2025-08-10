return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "echasnovski/mini.icons" },
        lazy = true,
        cmd = { "FzfLua" },
        keys = {
            { "<leader>ff", "<cmd>FzfLua files<CR>", { silent = true } },
            { "<leader>fw", "<cmd>FzfLua live_grep<CR>", { silent = true } },
            { "<leader>fb", "<cmd>FzfLua buffers<CR>", { silent = true } },
            { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { silent = true } },
            { "<leader>bi", "<cmd>FzfLua<CR>", { silent = true } },
        },
        opts = {
            defaults = {
                file_icons = "mini",
            },
            winopts = {
                border = "single",
                preview = {
                    border = "single",
                    scrollbar = false,
                },
            },
            hls = {
                backdrop = "FloatBorder",
            },
        },
    },
}
