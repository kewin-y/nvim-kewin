return {
    {
        "echasnovski/mini.files",
        lazy = true,
        dependencies = { "echasnovski/mini.icons" },
        keys = {
            {
                "<leader>w",
                function()
                    if not MiniFiles.close() then
                        MiniFiles.open()
                    end
                end,
                { silent = true },
            },
        },
        opts = {
            prefix = function() end,
        },
        version = false,
    },
    {
        "echasnovski/mini.base16",
        event = "VeryLazy",
        lazy = true,
        version = false,
    },
    { "echasnovski/mini.icons", version = false, opts = {} },
}
