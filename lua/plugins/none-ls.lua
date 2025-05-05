-- To handle prettier for all languages and docs format

return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Use prettier for many filetypes
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript", "typescript", "javascriptreact", "typescriptreact",
                        "json", "yaml", "markdown", "html", "css", "scss", "less",
                    },
                    -- If there is no prettier file in the code base, this is the default prettier configs.
                    extra_args = {
                        "--single-quote", "true",
                        "--semi", "true",
                        "--tab-width", "2",
                        "--print-width", "80"
                    },
                }),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    -- Format on save
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })

                    -- Manual formatting with <leader>f
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>",
                        { noremap = true, silent = true })
                end
            end,
        })
    end,
}
