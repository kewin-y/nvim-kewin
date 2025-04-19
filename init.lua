vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

_G.theme = "everforest"

require("config.opts")
require("config.keybinds")
require("config.lazy")
require("config.ui")

local format_group = vim.api.nvim_create_augroup("Format", {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    group = format_group,
    callback = function(_)
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
    group = format_group,
    callback = function(_)
        vim.opt.shiftwidth = 8
        vim.opt.tabstop = 8
    end,
})
