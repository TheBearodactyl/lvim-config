vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
	pattern = { "*.rs" },
	callback = function()
		local _, _ = pcall(vim.lsp.codelens.refresh)
	end,
})
