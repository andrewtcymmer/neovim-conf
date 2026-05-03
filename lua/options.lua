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
vim.o.breakindent = true -- from kickstart;
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for

-- Delete empty space from the end of lines on every save
-- autocmd BufWritePre * :%s/\s\+$//e

-- other stuff (copied from kickstart.nvim)
vim.g.have_nerd_font = false
vim.o.showmode = false -- already in status line
vim.o.undofile = true
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.smartcase = true
vim.o.signcolumn = "yes" -- Keep signcolumn on by default
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true --whitespace chars
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- vim.opt offers table interface over vim.o
vim.o.inccommand = "split"
vim.o.cursorline = true -- Show which line your cursor is on
vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.o.confirm = true -- See `:help 'confirm'` (raise dialog instead of just failing)

-- put this in the plugin config?
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- used to be ' ' in kickstart.nvim; lazy docs suggest the backslashes
