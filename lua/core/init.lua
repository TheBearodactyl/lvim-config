local M = {}

function M.setup()
	require("core.commands").setup()
	require("core.lsp").setup()
	require("core.utils").setup()
end

return M
