return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "echasnovski/mini.icons" },
        lazy = true,
        event = "VeryLazy",
        config = function()
            local colors = require("themes." .. _G.theme)

            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    global_status = true,
                    disabled_filetypes = {
                        statusline = {
                            "ministarter",
                        },
                    },
                    component_separators = {
                        left = "",
                        right = "",
                    },
                    section_separators = {
                        left = "",
                        right = "",
                    },
                    theme = {
                        normal = {
                            a = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            b = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            c = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            z = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            y = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                        },
                        insert = {
                            a = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            b = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            c = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            z = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            y = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                        },
                        command = {
                            a = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            b = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            c = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            z = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            y = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                        },
                        visual = {
                            a = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            b = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            c = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            z = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            y = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                        },
                        replace = {
                            a = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            b = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            c = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            z = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                            y = {
                                bg = colors.base01,
                                fg = colors.base05,
                            },
                        },
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "filename" },
                    lualine_c = { "branch", "diff" },
                    lualine_x = { "diagnostics" },
                    lualine_y = { "progress", "location" },
                    lualine_z = { "filetype" },
                },
            })
        end,
    },
}
