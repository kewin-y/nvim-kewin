local opts = { noremap = true, silent = false }

return {
    "zk-org/zk-nvim",
    ft = "markdown",
    keys = {
        { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts },
        { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts },
        { "<leader>zt", "<Cmd>ZkTags<CR>", opts },
        {
            "<leader>zf",
            "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
            opts,
        },
        { "<leader>zf", ":'<,'>ZkMatch<CR>", "v", opts },
        { "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts },
    },
    config = function()
        require("zk").setup({
            picker = "fzf_lua",

            lsp = {
                config = {
                    name = "zk",
                    cmd = { "zk", "lsp" },
                    filetypes = { "markdown" },
                },

                auto_attach = {
                    enabled = true,
                },
            },
        })
    end,
}
