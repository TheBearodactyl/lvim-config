local M = {}

function M.setup()
  return {
    win = {
      position = "bottom",
    },
    modes = {
      diagnostics = {
        auto_close = true,
        auto_open = true,
        win = {
          size = { height = 0.21 },
        },
      },
      symbols = {
        auto_open = true,
        auto_close = true,
        desc = "Document Symbols",
        mode = "lsp_document_symbols",
        focus = false,
        win = {
          position = "right",
          size = {
            width = 0.23,
          },
        },
        -- preview = {
        --   size = {
        --     width = 0.23
        --   }
        -- },
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
          },
        },
      },
    },
  }
end

return M
