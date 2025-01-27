local M = {}

function M.validate_table(required_data, given_data, optional_fields, strict)
  optional_fields = optional_fields or {}
  strict = strict or false

  if type(given_data) ~= "table" then
    return false, "given_data is not a table"
  end

  if strict then
    for key in pairs(given_data) do
      if required_data[key] == nil then
        return false, "extra field '" .. key .. "' is not allowed"
      end
    end
  end

  for key, expected_value in pairs(required_data) do
    local given_value = given_data[key]

    if optional_fields[key] and given_value == nil then
      goto continue
    end

    if given_value == nil then
      return false, "missing required field '" .. key .. "'"
    end

    if type(expected_value) ~= type(given_value) then
      return false,
          "field '"
          .. key
          .. "' has incorrect type (expected "
          .. type(expected_value)
          .. ", got "
          .. type(given_value)
          .. ")"
    end

    if type(expected_value) == "table" then
      local valid, err = validate_table(expected_value, given_value, optional_fields, strict)
      if not valid then
        return false, "field '" .. key .. "' is invalid: " .. err
      end
    end

    ::continue::
  end

  return true
end

return M
