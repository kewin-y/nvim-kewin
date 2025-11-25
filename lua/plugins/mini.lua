return {
    {
        "nvim-mini/mini.files",
        lazy = true,
        dependencies = { "nvim-mini/mini.icons", version = false, opts = {} },
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
        "nvim-mini/mini.base16",
        event = "VeryLazy",
        lazy = true,
        version = false,
    },
    {
        "nvim-mini/mini.hipatterns",
        event = "VeryLazy",
        lazy = true,
        version = false,
    },
}
