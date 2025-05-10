return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        -- JavaScript/TypeScript + Web
        formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "json",
            "yaml",
            "markdown",
            "html",
            "css",
            "scss",
            "less",
          },
          extra_args = { "--config-precedence", "prefer-file" },
        }),

        -- C, C++, Objective-C, Java
        formatting.clang_format.with({
          filetypes = { "c", "cpp", "objc", "java" },
        }),

        -- Python
        formatting.black,

        -- PHP
        formatting.phpcsfixer,

        -- Lua
        formatting.stylua,

        -- Shell
        formatting.shfmt,
      },

      -- Format on save using only null-ls
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(c)
                  return c.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
