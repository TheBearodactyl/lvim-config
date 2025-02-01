local M = {}

M.setup = function()
  require("code_runner").setup {
    filetype = {
      c = {
        "cmake --build $dir/../build --target Run",
      },
    },
  }
end

return M
