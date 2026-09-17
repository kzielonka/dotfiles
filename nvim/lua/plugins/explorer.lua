return {
  -- Neo-tree: Sidebar project tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle File Explorer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        width = 32,
      },
    },
  },

  -- Oil.nvim: Buffer-based file manager
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory with Oil" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = false, -- let neo-tree stay default directory handler
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
    },
  },
}
