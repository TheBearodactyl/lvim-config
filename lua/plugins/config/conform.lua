local M = {}

function M.setup()
  return {
    formatters_by_ft = {
      rust = { "leptosfmt", "rustfmt" },
    },
  }
end

return M
