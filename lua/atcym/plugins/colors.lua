-- double-bracing the return guarantees the lazy.nvim sees all the colors.
-- Without it, only the first configuration is returned.
-- Be sure to separate all the color config blocks with a comma!
return {
{
  'f4z3r/gruvbox-material.nvim',
  name = 'gruvbox-material',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function() 
    vim.g.gruvbox_material_enable_italic_comment = 1
    require'gruvbox-material'.setup{}
  end
},
{
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require'nordic'.load()
  end
},
{
  'neanias/everforest-nvim',
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require'everforest'.setup{
      -- Your config here
    }
  end
}
}
