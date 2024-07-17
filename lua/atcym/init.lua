vim.lsp.set_log_level("off") -- set to "debug" when debugging

require 'atcym.editor'
require 'atcym.autocmd'
require 'atcym.lazy' -- instead of requiring plugins, run the lazy loader

vim.cmd([[colorscheme nordic]])
