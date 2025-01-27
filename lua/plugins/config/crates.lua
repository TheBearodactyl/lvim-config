local M = {}

function M.setup()
  require("crates").setup({
    null_ls = {
      enabled = true,
      name = "crates.nvim",
    },
    popup = {
      border = "rounded"
    },
  })
end

return M
