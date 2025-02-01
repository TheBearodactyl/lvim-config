local M = {}

function M.setup()
  vim.api.nvim_create_user_command("ClassToStruct", function()
    local current_line = vim.api.nvim_get_current_line()
    local transformed_line =
      current_line:gsub("class%s+(%$?[%w_]+)%(([%w_]+),%s*([%w_]+)%s*%)%s*{", "struct %2 : geode::Modify<%2, %3> {")
    vim.api.nvim_set_current_line(transformed_line)
  end, { desc = "Transform class definition to struct definition" })

  vim.api.nvim_create_user_command("ClassToStructAll", function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in ipairs(lines) do
      local transformed_line =
        line:gsub("class%s+(%$?[%w_]+)%(([%w_]+),%s*([%w_]+)%s*%)%s*{", "struct %2 : geode::Modify<%2, %3> {")
      if transformed_line ~= line then
        vim.api.nvim_buf_set_lines(0, i - 1, i, false, { transformed_line })
      end
    end
  end, { desc = "Transform all class definitions to struct definitions" })

  vim.api.nvim_create_user_command("Movify", function(opts)
    local shift_amount = tonumber(opts.args)
    if not shift_amount then
      vim.notify("Please provide a valid number for shifting.", vim.log.levels.ERROR)
      return
    end
    local shift_cmd = shift_amount < 0 and "<" or ">"
    shift_amount = math.abs(shift_amount)
    vim.cmd(string.format(":'<,'>%s", string.rep(shift_cmd, shift_amount)))
  end, {
    nargs = 1,
    desc = "Shift selected text left or right by the specified number of shiftwidth units",
  })

  vim.api.nvim_create_user_command("BlockComment", function(opts)
    local start_row = opts.line1
    local end_row = opts.line2
    local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
    local commented_lines = { "/**" }
    for _, line in ipairs(lines) do
      table.insert(commented_lines, " * " .. line)
    end
    table.insert(commented_lines, " */")
    vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, commented_lines)
  end, { range = true })
end

return M
