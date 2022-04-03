local Module = {}

-- these ought to be assigned directly to LSPServer settings property
Module.settings = {
  ["rust-analyzer"] = {
    assist = {
      importGranularity = "module",
      importPrefix = "by_self",
    },
    cargo = {
      loadOutDirsFromCheck = true,
    },
    procMacro = {
      enable = true,
    }
  }
}

return Module
