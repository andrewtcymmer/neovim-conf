require('plugins')
local opt = vim.opt  -- to set options

-- standard stuff
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.fileencoding = "utf-8"

-- editor terrain
--  use vimscript to set vim options that I dont know yet where the lua vars are for them
vim.api.nvim_command([[
  set relativenumber
  set number
  set expandtab
  set nowrap
  set colorcolumn=120
  set ruler
]])

opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
opt.linebreak = true -- Stop words being broken on wrap
opt.list = false -- Show some invisible characters
-- opt.numberwidth = 5 -- Make the gutter wider by default

-- tab trickery
opt.autoindent = true
opt.softtabstop = 2
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for

-- default color scheme
vim.api.nvim_command([[
  augroup ChangeBackgroundColor
    autocmd colorscheme * :hi normal guibg=#2f383e
  augroup END
]])
opt.termguicolors = true
opt.background = 'dark'
vim.cmd [[silent! colorscheme everforest]]

-- typescript: find a better place for this
require'lspconfig'.tsserver.setup{}


-- research these and enable later

-- opt.backspace = {"indent", "eol", "start"}
-- opt.clipboard = "unnamedplus"
-- opt.completeopt = "menuone,noselect"
-- opt.cursorline = true
-- opt.foldenable = false
-- opt.foldmethod = "indent"
-- opt.formatoptions = "l"
-- opt.hidden = true -- Enable background buffers
-- opt.hlsearch = true -- Highlight found searches
-- opt.ignorecase = true -- Ignore case
-- opt.inccommand = "split" -- Get a preview of replacements
-- opt.incsearch = true -- Shows the match while typing
-- opt.joinspaces = false -- No double spaces with join
-- opt.scrolloff = 4 -- Lines of context
-- opt.shiftround = true -- Round indent
-- opt.showmode = false -- Don't display mode
-- opt.sidescrolloff = 8 -- Columns of context
-- opt.signcolumn = "yes:1" -- always show signcolumns
-- opt.smartcase = true -- Do not ignore case with capitals
-- opt.smartindent = true -- Insert indents automatically
-- opt.spelllang = "en"
-- opt.splitbelow = true -- Put new windows below current
-- opt.splitright = true -- Put new windows right of current
-- opt.wrap = true
