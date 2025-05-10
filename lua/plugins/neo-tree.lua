return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle position=right<cr>", desc = "Toggle Explorer" },
    { "<leader>E", "<cmd>Neotree toggle position=left<cr>", desc = "Toggle Explorer (Left)" },
  },
  opts = {
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
    window = {
      position = "right",
      width = 30,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        -- File operations
        ["r"] = "rename", -- Rename with 'r'
        ["a"] = "add", -- Add new file with 'a'
        ["d"] = "delete", -- Delete with 'd'
        ["y"] = "copy_to_clipboard", -- Copy path with 'y'
        ["x"] = "cut_to_clipboard", -- Cut with 'x'
        ["p"] = "paste_from_clipboard", -- Paste with 'p'
        ["c"] = "copy", -- Copy file to another location with 'c'
        ["m"] = "move", -- Move file to another location with 'm'

        -- Navigation
        ["<space>"] = "toggle_node", -- Expand/collapse with space
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["S"] = "open_split", -- Open in horizontal split with 'S'
        ["s"] = "open_vsplit", -- Open in vertical split with 's'
        ["t"] = "open_tabnew", -- Open in new tab with 't'

        -- Other operations
        ["R"] = "refresh", -- Refresh with 'R'
        ["?"] = "show_help", -- Show help with '?'
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    event_handlers = {
      {
        event = "file_renamed",
        handler = function(args)
          -- Auto refresh when renaming files
          require("neo-tree.sources.manager").refresh()
        end,
      },
    },
  },
}
