local m = vim.keymap.set

-- Toggle mini.files
local function toggleMiniFiles()
	if not MiniFiles.close() then
		MiniFiles.open()
	end
end

m("n", "<leader>w", toggleMiniFiles, { silent = true })

-- fzf
m("n", "<leader>ff", "<cmd>FzfLua files<CR>", { silent = true })
m("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { silent = true })
m("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { silent = true })
m("n", "<leader>bi", "<cmd>FzfLua<CR>", { silent = true })


-- Turn off highlighting
m("n", "<Esc>", "<cmd>noh<CR>", { silent = true })

-- Window :3
m("n", "<C-h>", "<C-w>h")
m("n", "<C-l>", "<C-w>l")
m("n", "<C-j>", "<C-w>j")
m("n", "<C-k>", "<C-w>k")

-- Move up & down within wrapped line
m({"n", "v"}, "k", [[v:count || mode(1)[0:1] == "no" ? "k" : "gk"]], { expr = true })
m({"n", "v"}, "j", [[v:count || mode(1)[0:1] == "no" ? "j" : "gj"]], { expr = true })

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
