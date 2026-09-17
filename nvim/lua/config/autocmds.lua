local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- Resize splits proportionally on terminal window resize
autocmd("VimResized", {
  desc = "Resize splits proportionally on window resize",
  group = augroup("resize_splits", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Close utility buffers with 'q'
autocmd("FileType", {
  desc = "Close utility buffers with q",
  group = augroup("close_with_q", { clear = true }),
  pattern = {
    "help",
    "lspinfo",
    "man",
    "qf",
    "checkhealth",
    "lazy",
    "mason",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})
