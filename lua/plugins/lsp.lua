return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local lspconfig = require("lspconfig")

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "html", "cssls", "typescript", "eslint", "jsonls", "tailwindcss",
                "emmet_ls", "graphql", "yamlls", "lua_ls", "intelephense", "pyright",
                "jdtls", "clangd", "rust_analyzer", "bashls", "dockerls", "marksman",
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = { version = 'LuaJIT' },
                                diagnostics = { globals = { 'vim' } },
                                workspace = { library = { vim.env.VIMRUNTIME } },
                            },
                        },
                    })
                end,
            }
        })

        -- Diagnostic config
        vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
            float = {
                style = "minimal",
                border = "rounded",
                header = "",
                prefix = "",
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "✘",
                    [vim.diagnostic.severity.WARN] = "▲",
                    [vim.diagnostic.severity.HINT] = "⚑",
                    [vim.diagnostic.severity.INFO] = "»",
                },
            },
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        -- LSP keybindings
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }
                local map = vim.keymap.set
                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "gD", vim.lsp.buf.declaration, opts)
                map("n", "gi", vim.lsp.buf.implementation, opts)
                map("n", "go", vim.lsp.buf.type_definition, opts)
                map("n", "gr", vim.lsp.buf.references, opts)
                map("n", "gs", vim.lsp.buf.signature_help, opts)
                map("n", "gl", vim.diagnostic.open_float, opts)
                map("n", "<F2>", vim.lsp.buf.rename, opts)
                map({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
                map("n", "<F4>", vim.lsp.buf.code_action, opts)
            end,
        })
    end
}
