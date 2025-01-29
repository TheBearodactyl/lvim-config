local M = {}

function M.setup()
  local lsp_manager = require("lvim.lsp.manager")
  local formatters = require("lvim.lsp.null-ls.formatters")
  local linters = require("lvim.lsp.null-ls.linters")

  local function setup_lsp(lsp_name, lsp_config, verbose)
    lsp_manager.setup(lsp_name, lsp_config)
    if verbose then
      vim.notify("Successfully set up LSP for " .. lsp_name, vim.log.levels.INFO)
    end
  end

  local function setup_linter(linter_config)
    linters.setup(linter_config)
  end

  local function setup_formatter(formatter_config)
    formatters.setup(formatter_config)
  end

  -- LSP configurations
  setup_lsp("nushell", {
    cmd = { "nu.exe", "--lsp" },
    ft = "nu",
    desc = "The Nushell LSP server",
    enabled = true,
  }, false)

  setup_lsp("taplo", {
    cmd = { "taplo.exe", "lsp", "stdio" },
    ft = "toml",
    desc = "Taplo",
    enabled = true,
  }, false)

  -- Linter configurations
  setup_linter({
    name = "taplo",
    command = "taplo",
    args = { "--" },
    filetypes = { "toml" },
  })

  -- Formatter configurations
  setup_formatter({
    name = "leptosfmt",
    command = "leptosfmt",
    filetypes = { "rs", "rust" },
  })

  lvim.lsp.on_attach_callback = function(_, _)
    require("lsp_signature").on_attach()
  end

  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
end

return M
