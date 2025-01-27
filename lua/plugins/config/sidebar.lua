local M = {}

function M.setup()
  local sidebar = require("sidebar-nvim")
  local opts = {
    open = true
  }

  sidebar.setup(opts)
end

return M
