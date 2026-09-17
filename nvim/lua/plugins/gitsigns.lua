return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation between changed hunks
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Next Git Hunk" })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Previous Git Hunk" })

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage Selected Hunk" })
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset Selected Hunk" })
      map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk Diff" })
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, { desc = "Git Blame Line" })
      map("n", "<leader>hd", gs.diffthis, { desc = "Git Diff File" })
    end,
  },
}
