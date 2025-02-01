local M = {}

M.setup = function()
  local osys = require("cmake-tools.osys")

  require("cmake-tools").setup {
    cmake_command = "cmake",
    ctest_command = "ctest",
    cmake_regenerate_on_save = true,
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_directory = function()
      if osys.iswin64 or osys.iswin32 then
        return "target\\${variant:buildType}"
      end

      return "target/${variant:buildType}"
    end,
    cmake_notifications = {
      runner = { enabled = true },
      executor = { enabled = true },
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
      refresh_rate_ms = 100, -- how often to iterate icons
    },
    cmake_virtual_text_support = true,
  }
end

return M
