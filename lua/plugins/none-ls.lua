-- For document formatting
return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript", "typescript", "javascriptreact", "typescriptreact",
                        "json", "yaml", "markdown", "html", "css", "scss", "less",
                    },
                    -- 👇 This ensures .prettierrc is used if present
                    extra_args = { "--config-precedence", "prefer-file" },
                }),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })

                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>",
                        { noremap = true, silent = true })
                end
            end,
        })
    end,
}
