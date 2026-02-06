local m = vim.keymap.set

-- MOVE
m("i", "<C-h>", "<Left>", { desc = "move left" })
m("i", "<C-l>", "<Right>", { desc = "move right" })
m("i", "<C-j>", "<Down>", { desc = "move down" })
m("i", "<C-k>", "<Up>", { desc = "move up" })

-- Turn off highlighting
m("n", "<Esc>", "<cmd>noh<CR>", { silent = true })

-- Move up & down within wrapped line
m({ "n", "v" }, "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk"]], { expr = true })
m({ "n", "v" }, "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj"]], { expr = true })

-- Clipboard
m({ "n", "v" }, "<leader>y", [["+y]])
m("n", "<leader>Y", [["+Y]])

-- Greatest keymaps ever
m("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
m("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- QOL
m("n", "J", "mzJ`z")
m("v", "<", "<gv")
m("v", ">", ">gv")

-- Tabs
m("n", "<leader>tt", "<Cmd>tabnew<CR>")
m("n", "<leader>tw", "<Cmd>tabclose<CR>")

--- Oil
m("n", "<leader>w", "<CMD>edit .<CR>")

local function open_in_obsidian()
    local vault = "notes" -- <-- change this
    local file = vim.fn.expand("%:p")

    if file == "" then
        vim.notify("No file name", vim.log.levels.WARN)
        return
    end

    -- convert absolute path → vault-relative path
    local vault_path = vim.fn.expand("~/Documents/notes") -- <-- change this
    local rel = file:gsub("^" .. vim.pesc(vault_path) .. "/", "")

    -- URL encode spaces
    rel = rel:gsub(" ", "%%20")

    local url = string.format("obsidian://open?vault=%s&file=%s", vault, rel)

    vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end

m("n", "<leader>op", function()
    open_in_obsidian()
end)
