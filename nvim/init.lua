-- Set leader key to space before any plugins or mappings load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core configurations
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Plugin management with Lazy.nvim
require("config.lazy")
