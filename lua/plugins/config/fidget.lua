local M = {}

function M.setup()
  require("fidget").setup {
    notification = {
      view = {
        stack_upwards = false,
      },
      window = {
        border = "rounded",
        align = "bottom",
      },
    },
  }
end

return M
