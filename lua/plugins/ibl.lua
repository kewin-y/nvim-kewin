return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",

    ---@module "ibl"
    ---@type ibl.config
    opts = {
        indent = {
            char = "│",
        },
        scope = {
            enabled = false,
        },
    },
}
