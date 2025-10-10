return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>fm",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            markdown = { "prettierd" },
            astro = { "prettierd" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            nix = { "alejandra" },
            typst = { "typstyle" },
            typescript = { "prettierd" },
            javascript = { "prettierd" },
            rust = { "rustfmt" },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters = {},
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
