return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>c", group = "Code / LSP" },
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>b", group = "Buffer" },
    })
  end,
}
