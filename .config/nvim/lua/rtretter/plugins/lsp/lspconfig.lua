return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local mason_lspconfig = require("mason-lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "(Goto References) Show LSP references"
                keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)
                keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "(Goto Definitions) Show LSP definitions"
                keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "(Goto Declarations) Show LSP declarations"
                keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "(Goto Implementations) Show LSP implementations"
                keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "(Goto TypeDef) Show LSP type definitions"
                keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "(Code Action) See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "(Restart Server) Restart LSP"
                keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)

                opts.desc = "(ReName) Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "(Diagnostics) Show code diagnostics"
                keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)

                opts.desc = "(Diagnostic Next) Next code diagnostic"
                keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
                keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)

                opts.desc = "(Diagnostic Previous) Next code diagnostic"
                keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
                keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
        })
    end,
}
