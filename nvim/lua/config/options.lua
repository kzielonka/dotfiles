-- Line numbers (standard 1, 2, 3... numbering)
vim.opt.number = true
vim.opt.relativenumber = false

-- 2-space indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- macOS system clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Window splitting behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scrolling & display
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Persistent undo & performance
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
