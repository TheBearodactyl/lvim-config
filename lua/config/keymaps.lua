local M = {}

function M.setup()
  -- Rust keybindings
  local rust_mappings = {
    name = "Rust",
    R = {
      "<cmd>RustLsp reloadWorkspace<cr>",
      "Reload Workspace",
    },
    o = { "<cmd>RustOpenExternalDocs<Cr>", "[crate] Open External Docs" },
    y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
    P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
    i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
    f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
    D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
  }

  local spectre_nmappings = {
    name = "[n] Spectre",
    w = { "<cmd>lua require'spectre'.toggle()<cr>", "Toggle Spectre" },
    p = { "<cmd>lua require'spectre'.open_file_search({select_word=true})<cr>", "Search current file" },
  }

  local spectre_vmappings = {
    name = "[v] Spectre",
    w = { "<cmd>lua require'spectre'.open_visual()<cr>", "Search current word" },
  }

  local sidebar_mappings = {
    name = "Sidebar",
    t = { "<cmd>SidebarNvimToggle<cr>", "Toggle the sidebar" },
  }

  -- Diagnostics keybindings
  local diagnostics_mappings = {
    name = "Diagnostics",
    t = { "<cmd>Trouble diagnostics toggle<cr>", "Trouble" },
    w = { "<cmd>Trouble workspace_diagnostics toggle<cr>", "Workspace" },
    d = { "<cmd>Trouble document_diagnostics toggle<cr>", "Document" },
    q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
    l = { "<cmd>Trouble loclist<cr>", "Loclist" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
  }

  lvim.builtin.which_key.mappings["lh"] = {
    "<cmd>lua require'pretty_hover'.hover()<cr>",
    "Hover",
  }

  -- Rust keybinds
  lvim.builtin.which_key.mappings["R"] = rust_mappings
  lvim.builtin.which_key.mappings["S"] = spectre_nmappings
  lvim.builtin.which_key.vmappings["S"] = spectre_vmappings
  lvim.builtin.which_key.mappings["B"] = sidebar_mappings
  lvim.builtin.which_key.mappings["D"] = diagnostics_mappings
end

return M
