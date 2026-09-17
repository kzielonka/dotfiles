return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
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
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
