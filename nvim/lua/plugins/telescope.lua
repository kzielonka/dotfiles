return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
        },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    })

    -- Load fzf extension if compiled
    pcall(telescope.load_extension, "fzf")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
    vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Find String Under Cursor" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
  end,
}
