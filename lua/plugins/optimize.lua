return {
  -- Disable unnecessary UI elements
  { "folke/noice.nvim", enabled = true},  -- Fancy UI notifications, can be heavy
  { "rcarriga/nvim-notify", enabled = true },  -- Notification manager
  
  -- Disable unused tools
  { "nvim-neo-tree/neo-tree.nvim", enabled = true },  -- Use default explorer instead
  { "akinsho/bufferline.nvim", enabled = true },  -- Tab bar, use tabs or statusline instead
  { "nvim-pack/nvim-spectre", enabled = true },  -- Find and replace across files
  
  -- Disable heavy git integrations if not needed
  { "lewis6991/gitsigns.nvim", enabled = true },
  { "kdheepak/lazygit.nvim", enabled = true },
  
  -- Disable heavy autocompletion features if not needed
  { "zbirenbaum/copilot.lua", enabled = true },
  { "rafamadriz/friendly-snippets", enabled = true },
  
  -- Disable extra language support if not used
  { "folke/neodev.nvim", enabled = true },  -- Extra Lua development support
  { "nvim-treesitter/nvim-treesitter-context", enabled = true },
  
  -- Disable terminal integration if not used
  { "akinsho/toggleterm.nvim", enabled = true },
  
  -- Keep bare minimum UI
  { "nvim-lualine/lualine.nvim", enabled = true },  -- Status line is useful
}
