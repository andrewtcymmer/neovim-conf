require('nordic').colorscheme({
  underline_option = 'none',
  italic = true,
  italic_comments = false,
  minimal_mode = false,
  alternate_backgrounds = false
})

vim.g.gruvbox_material_enable_italic_comment = 1
require('gruvbox-material').setup()

require('everforest').setup()

-- Switch the default colorscheme
vim.cmd([[colorscheme everforest]])
