-- standard stuff
vim.opt.encoding = "utf-8" -- Set default encoding to UTF-8
vim.opt.fileencoding = "utf-8"

-- editor terrain
-- wo stands for "window option". See :h vim.wo for details on these.
vim.o.expandtab = true
vim.o.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.opt.linebreak = true -- Stop words being broken on wrap
vim.opt.list = false -- Show some invisible characters

-- tab trickery
-- Some languages override this (Rust for example has its own formatter rule about tab width).
vim.opt.autoindent = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for

-- Delete empty space from the end of lines on every save
-- autocmd BufWritePre * :%s/\s\+$//e
