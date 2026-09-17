local map = vim.keymap.set

-- Clear search highlight on pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better window navigation using Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Window resizing using Ctrl + Arrows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Centered" })
map("n", "n", "nzzzv", { desc = "Next Search Result Centered" })
map("n", "N", "Nzzzv", { desc = "Prev Search Result Centered" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close Buffer" })

-- Move selected lines up/down in Visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

-- Better paste: pasting over visual selection doesn't overwrite default register
map("x", "p", [["_dP]], { desc = "Paste without overwriting register" })

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>d", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Show Line Diagnostic Details" })
map("n", "<leader>cd", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Show Line Diagnostic Details" })
map("n", "gl", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Show Line Diagnostic Details" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Quickfix List" })
