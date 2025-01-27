local M = {}

--- @alias buffermode "n"|"v"

--- Helper function to ensure a category exists
--- @param category string The name of the category to ensure exists.
--- @param mappings table The mappings table (either normal or visual mode) where the category should exist
local function ensure_category(category, mappings)
  if not mappings[category] then
    mappings[category] = { name = category }
  end
end

--- Add an empty category to the Which Key configuration
--- @param name (string) The name of the new category
--- @param mode buffermode The mode of the category. Defaults to "n" (normal mode). Use "v" for visual mode
--- @return self table Returns itself for method chaining
function M.add_empty_category(name, mode)
  mode = mode or "n"
  local mappings = mode == "v" and lvim.builtin.which_key.vmappings or lvim.builtin.which_key.mappings
  ensure_category(name, mappings)

  return M
end

--- Add keybinds to an existing category in the Which Key configuration
--- @param category string The name of the category to add the keybinds to.
--- @param binds table A table of keybinds to add, where keys are the keybind strings and values are tables containing the command and description.
--- @param mode buffermode The mode of the category. Defaults to "n" (normal mode). Use "v" for visual mode
--- @return self table Returns itself for method chaining
function M.add_keybinds(category, binds, mode)
  mode = mode or "n"
  local mappings = mode == "v" and lvim.builtin.which_key.vmappings or lvim.builtin.which_key.mappings
  ensure_category(category, mappings)

  for key, bind in pairs(binds) do
    mappings[category][key] = bind
  end

  return M
end

--- Redefine the command and/or description of an existing keybind in a category
--- @param category string The name of the category containing the keybind
--- @param key string The keybind to redefine
--- @param new_bind table A table containing the new command and description for the keybind
--- @param mode buffermode The mode of the keybind. Defaults to "n" (normal mode). Use "v" for visual mode.
--- @return self table Returns itself for method chaining
function M.redefine_keybind(category, key, new_bind, mode)
  mode = mode or "n"
  local mappings = mode == "v" and lvim.builtin.which_key.vmappings or lvim.builtin.which_key.mappings

  if mappings[category] and mappings[category][key] then
    mappings[category][key] = new_bind
  else
    error("Keybind not found in category: " .. category .. " with key: " .. key)
  end

  return M
end

--- Add a new subcategory to an existing category in the which-key configuration.
--- @param parent_category string The name of the parent category to add the subcategory to.
--- @param subcategory string The name of the subcategory to add.
--- @param keybinds table A table of keybinds to add to the subcategory.
--- @param mode buffermode The mode to add the subcategory to. Defaults to "n" (normal mode). Use "v" for visual mode.
--- @return self table Returns itself for method chaining
function M.add_subcategory(parent_category, subcategory, keybinds, mode)
  mode = mode or "n"
  local mappings = mode == "v" and lvim.builtin.which_key.vmappings or lvim.builtin.which_key.mappings
  ensure_category(parent_category, mappings)

  if not mappings[parent_category][subcategory] then
    mappings[parent_category][subcategory] = { name = subcategory }
  end

  for key, bind in pairs(keybinds) do
    mappings[parent_category][subcategory][key] = bind
  end

  return M
end

--- Remove a keybind from a category in the which-key configuration.
--- @param category string The name of the category containing the keybind.
--- @param key string The keybind to remove.
--- @param mode buffermode The mode of the keybind. Defaults to "n" (normal mode). Use "v" for visual mode.
--- @return self table Returns itself for method chaining
function M.remove_keybind(category, key, mode)
  mode = mode or "n"
  local mappings = mode == "v" and lvim.builtin.which_key.vmappings or lvim.builtin.which_key.mappings

  if mappings[category] then
    mappings[category][key] = nil
  end

  return M
end

--- Updates the which-key configuration to apply changes.
--- This function should be called *after* making modifications to ensure the changes take effect.
function M.build()
  require("which-key").setup()
end

return M
