return {
    {
        "echasnovski/mini.files",
        lazy = true,
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
    {
        "echasnovski/mini.starter",
        lazy = false,
        config = function()
            local mini_starter = require("mini.starter")

            mini_starter.setup({
                evaluate_single = true,
                header = "hello",
                footer = "",
                content_hooks = {
                    mini_starter.gen_hook.aligning("center", "center"),
                },
                items = {
                    mini_starter.sections.builtin_actions(),
                    mini_starter.sections.recent_files(5, true, false),
                    mini_starter.sections.recent_files(5, false, false),
                },
            })
        end,
        version = false,
    },
}
