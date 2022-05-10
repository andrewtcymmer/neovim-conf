local Module = {}

Module.makeLspSetupOptions = function(on_attach)
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps.textDocument.completion.completionItem.snippetSupport = true

  return {
    capabilities = caps,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    },
    tools = {
      autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
      }
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importMergeBehavior = "last",
            importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true,
          },
          diagnostics = {
            disabled = { 
              "unresolved-import"
            }
          },
          procMacro = {
            enable = true,
          },
          checkOnSave = {
            command = "clippy"
          }
        }
      }
    }
  }
end


return Module
