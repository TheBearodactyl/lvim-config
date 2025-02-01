local M = {}

function M.setup()
  require("plugins.config.crates").setup()
  require("plugins.config.fidget").setup()
  require("plugins.config.rust-tools").setup()
  require("plugins.config.telescope").setup()
  require("plugins.config.sidebar").setup()
  require("plugins.config.trouble").setup()
  require("plugins.config.tabnine").setup()
  require("plugins.config.lspkind").setup()
  require("plugins.config.conform").setup()
  require("plugins.config.runner").setup()
  require("plugins.config.cmake-tools").setup()
end

return M
