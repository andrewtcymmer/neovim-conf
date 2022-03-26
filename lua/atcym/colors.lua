require('nordic').colorscheme({
  underline_option = 'none',
  italic = true,
  italic_comments = false,
  minimal_mode = false,
  alternate_backgrounds = false
})

-- before nordic, I was using everforest. Everforest was nice but Nordic is 100% lua!
-- These are left-over from how to set Everforest up to look right...

-- vim.api.nvim_command([[
--   augroup ChangeBackgroundColor
--   autocmd colorscheme * :hi normal guibg=#2f383e
--   augroup END
-- ]])
-- vim.opt.termguicolors = true
-- vim.opt.background = 'dark'
-- vim.cmd [[silent! colorscheme everforest]]

