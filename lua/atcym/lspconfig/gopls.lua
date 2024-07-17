local Module = {}

Module.makeLspSetupOptions = function(on_attach)
  return {
    on_attach = on_attach,
    -- cmd, filetypes, root_dir are all default
  }
end

return Module
