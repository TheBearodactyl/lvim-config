local M = {}

function M.setup()
  local lspkind = require "lspkind"

  lvim.builtin.cmp.formatting = {
    format = lspkind.cmp_format {
      mode = "symbol",
      maxwidth = {
        menu = 50,
        abbr = 50,
      },
      ellipsis_char = "...",
      show_labelDetails = true,
    },
  }
end

return M
