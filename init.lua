require('plugins')

-- standard stuff
vim.opt.encoding = "utf-8" -- Set default encoding to UTF-8
vim.opt.fileencoding = "utf-8"

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

vim.opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
vim.opt.linebreak = true -- Stop words being broken on wrap
vim.opt.list = false -- Show some invisible characters
-- opt.numberwidth = 5 -- Make the gutter wider by default

-- tab trickery
vim.opt.autoindent = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for

-- default color scheme
-- everforest guibg: 2f383e
-- shadorain (name: xshado) guibg: 09090d
vim.api.nvim_command([[
  augroup ChangeBackgroundColor
    autocmd colorscheme * :hi normal guibg=#2f383e
  augroup END
]])
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd [[silent! colorscheme everforest]]

-- typescript: find a better place for this
require'lspconfig'.tsserver.setup{}

-- autocompletion
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

-- ### compe keybindings ###

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- vim.api.nvim_set_keymap('i', '<CR>', "v:lua.carriage_accept()", {expr = true})

-- ### end compe keybindings ###


-- For some future version, these might work. In 0.5 gotta use vimscript for keybinding.
-- vim.api.nvim_buf_set_keymap(0, 'i', '<C-Space>', "<cmd>lua require('compe').complete()<CR>", { expr = true, noremap = true, silent = true })
-- vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', "compe#confirm('<CR>')", { expr = true, noremap = true, silent = true })
-- vim.api.nvim_buf_set_keymap(0, 'i', '<C-e>', "compe#close('<C-e>')", { expr = true, noremap = true, silent = true })
-- vim.api.nvim_buf_set_keymap(0, 'i', '<C-f>', "compe#scroll({ 'delta': +4 })", { expr = true, noremap = true, silent = true })
-- vim.api.nvim_buf_set_keymap(0, 'i', '<C-d>', "compe#scroll({ 'delta': -4 })", { expr = true, noremap = true, silent = true })

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
