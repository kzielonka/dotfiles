return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    local parsers = {
      "go",
      "gomod",
      "gosum",
      "gowork",
      "typescript",
      "javascript",
      "tsx",
      "ruby",
      "lua",
      "luadoc",
      "json",
      "yaml",
      "toml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "bash",
      "vim",
      "vimdoc",
      "dockerfile",
    }
    ts.install(parsers)

    -- Enable Treesitter syntax highlighting for all supported buffers
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user_treesitter_highlight", { clear = true }),
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
