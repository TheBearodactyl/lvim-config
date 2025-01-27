local M = {}

-- Checks if a table contains the specified value
--
-- @param tbl (table) The table to search
-- @param val (any) The value to look for
-- @param deep (boolean) [optional] Whether to search nested tables (default: false)
-- @return (boolean) True if value is found, false otherwise
function M.contains_value(tbl, val, deep)
  if type(tbl) ~= "table" then return false end

  local visited = {}
  local function search(t)
    if visited[t] then return false end

    visited[t] = true

    for _, v in pairs(t) do
      if v == val then
        return true
      elseif deep and type(v) == "table" then
        if search(v) then
          return true
        end
      end
    end

    return false
  end

  return search(tbl)
end

return M
