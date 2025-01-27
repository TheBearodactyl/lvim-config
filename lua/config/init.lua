local M = {}

function M.setup()
	require("config.autocmds")
	require("config.keymaps").setup()
	require("config.options").setup()
	require("config.plugins")
end

return M
