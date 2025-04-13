return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspStart" },
        config = function()
            local servers = {
                "lua_ls",
                "markdown_oxide",
            }

            for _, server in pairs(servers) do
                vim.lsp.enable(server)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                -- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/init.lua
                group = vim.api.nvim_create_augroup("KevinLsp", {}),
                callback = function(_)
                    local lsp = vim.lsp.buf
                    vim.keymap.set("n", "gd", lsp.definition, { desc = "Goto Definition" })
                    vim.keymap.set("n", "gr", lsp.references, { desc = "Goto References" })
                    vim.keymap.set("n", "gD", lsp.declaration, { desc = "Goto Declaration" })
                    vim.keymap.set("n", "gi", lsp.implementation, { desc = "Goto Implementation" })
                    vim.keymap.set("n", "gT", lsp.type_definition, { desc = "Type Definition" })
                    vim.keymap.set("n", "K", lsp.hover, { desc = "Hover" })
                    vim.keymap.set(
                        "n",
                        "<leader>cw",
                        lsp.workspace_symbol,
                        { desc = "Workspace Symbol" }
                    )
                    vim.keymap.set("n", "<leader>ra", lsp.rename, { desc = "Rename" })
                    vim.keymap.set("n", "<leader>ca", lsp.code_action, { desc = "Code Action" })

                    local diag = vim.diagnostic
                    vim.keymap.set("n", "[d", function()
                        diag.jump({ count = 1, float = true })
                    end, { desc = "Next Diagnostic" })
                    vim.keymap.set("n", "]d", function()
                        diag.jump({ count = -1, float = true })
                    end, { desc = "Previous Diagnostic" })
                end,
            })
        end,
    },
}
