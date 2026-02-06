local opts = { noremap = true, silent = false }

return {
    "zk-org/zk-nvim",
    ft = "markdown",
    keys = {
        { "<leader>on", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts },
        { "<leader>oo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts },
        { "<leader>ot", "<Cmd>ZkTags<CR>", opts },
        {
            "<leader>of",
            "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
            opts,
        },
        { "<leader>of", ":'<,'>ZkMatch<CR>", "v", opts },
        { "<leader>ob", "<Cmd>ZkBacklinks<CR>", opts },
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
