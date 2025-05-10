-- ~/.config/nvim/lua/plugins/lspconfig.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      -- Do nothing here - let LazyVim handle the default setup
    end,
  },

  -- Make sure Mason is properly configured
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
      },
    },
  },

  -- Just use the default LazyVim setup for mason-lspconfig
  { "williamboman/mason-lspconfig.nvim" },
}
