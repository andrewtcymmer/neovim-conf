-- https://github.com/jakewvincent/texmagic.nvim
local Module = {}

Module.makeLspSetupOptions = function(on_attach)
  local caps = vim.lsp.protocol.make_client_capabilities()
  return {
    capabilities = caps,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    },
    -- The following are recommended by the git repo docs.
    cmd = {"texlab"},
    filetypes = {"tex", "bib"},
    settings = {
      texlab = {
        rootDirectory = nil,
        build = _G.TeXMagicBuildConfig,
        forwardSearch = {
          executable = "evince",
          args = {"%p"}
        }
      }
    }
  }
end

return Module
