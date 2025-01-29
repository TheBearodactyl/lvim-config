local M = {}

function M.setup()
  return {
    win = {
      position = "right"
    },
    modes = {
      diagnostics = {
        auto_close = true,
        auto_open = true
      },
      test = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3
        }
      },
      symbols = {
        desc = "Document Symbols",
        mode = "lsp_document_symbols",
        focus = false,
        win = { position = "right" },
        filter = {
          ["not"] = { ft = "lua", kind = "Package" },
          any = {
            ft = { "help", "markdown" },
            kind = {
              "Class",
              "Constructor",
              "Enum",
              "Field",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              "Package",
              "Property",
              "Struct",
              "Trait",
            },
          }
        }
      }
    }
  }
end

return M
