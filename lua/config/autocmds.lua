vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
  pattern = { "*.rs" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local ok, _ = pcall(require, "trouble")
    if ok then
      vim.cmd "Trouble diagnostics close"
    end
  end,
  group = vim.api.nvim_create_augroup("TroubleAutoClose", { clear = true }),
})
