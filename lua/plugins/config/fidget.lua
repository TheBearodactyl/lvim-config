local M = {}

function M.setup()
  return {
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
