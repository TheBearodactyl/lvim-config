local M = {}

function M.setup()
  local tabnine = require("cmp_tabnine.config")

  tabnine:setup({ show_prediction_strength = true })

  lvim.builtin.cmp = {
    sources = {
      { name = "cmp_tabnine" },
    },
  }
end

return M
