local m = vim.keymap.set
local opts = { noremap = true, silent = false }

-- MOVE
m("i", "<C-h>", "<Left>", { desc = "move left" })
m("i", "<C-l>", "<Right>", { desc = "move right" })
m("i", "<C-j>", "<Down>", { desc = "move down" })
m("i", "<C-k>", "<Up>", { desc = "move up" })

-- Turn off highlighting
m("n", "<Esc>", "<cmd>noh<CR>", { silent = true })

-- Window
m("n", "<C-h>", "<C-w>h")
m("n", "<C-l>", "<C-w>l")
m("n", "<C-j>", "<C-w>j")
m("n", "<C-k>", "<C-w>k")

-- Move up & down within wrapped line
m({ "n", "v" }, "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk"]], { expr = true })
m({ "n", "v" }, "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj"]], { expr = true })

-- Clipboard
m({ "n", "v" }, "<leader>y", [["+y]])
m("n", "<leader>Y", [["+Y]])

-- Greatest keybinds ever
m("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
m("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- QOL
m("n", "J", "mzJ`z")
m("v", "<", "<gv")
m("v", ">", ">gv")

-- Tabs
m("n", "<leader>tt", "<Cmd>tabnew<CR>")
m("n", "<leader>tw", "<Cmd>tabclose<CR>")
m("n", "<A-l>", "<Cmd>tabnext<CR>")
m("n", "<A-h>", "<Cmd>tabprevious<CR>")

-- zk
m("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
m("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
m("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
m(
    "n",
    "<leader>zf",
    "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
    opts
)
m("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
