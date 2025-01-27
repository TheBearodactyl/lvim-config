local M = {}

function M.setup()
	require("plugins.config.crates").setup()
	require("plugins.config.fidget").setup()
	require("plugins.config.rust-tools").setup()
	require("plugins.config.telescope").setup()
  require("plugins.config.sidebar").setup()
  require("plugins.config.trouble").setup()
end

return M
