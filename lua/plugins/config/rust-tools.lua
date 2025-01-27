local M = {}

function M.setup()
  local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
  local codelldb_path = mason_path .. "bin/codelldb"
  local liblldb_path = mason_path .. "packages/codelldb/extension/lldb/lib/liblldb"
  local this_os = vim.loop.os_uname().sysname

  if this_os:find("Windows") then
    codelldb_path = mason_path .. "packages\\codelldb\\extension\\adapter\\codelldb.exe"
    liblldb_path = mason_path .. "packages\\codelldb\\extension\\lldb\\bin\\liblldb.dll"
  else
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local cfg = require("rustaceanvim.config")

  vim.g.rustaceanvim = function()
    return {
      tools = {
        executor = require("rustaceanvim.executors").termopen,
        reload_workspace_from_cargo_toml = true,
        runnables = { use_telescope = true },
        inlay_hints = {
          auto = true,
          only_current_line = false,
          show_parameter_hints = false,
          parameter_hints_prefix = "<-",
          other_hints_prefix = "=>",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = "Comment",
        },
        hover_actions = {
          border = "rounded",
        },
      },
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        on_attach = function(client, bufnr)
          require("lvim.lsp").common_on_attach(client, bufnr)
          local rt = require("rustaceanvim.hover_actions")
          vim.keymap.set("n", "K", rt.hover_actions, { buffer = bufnr })
        end,
        capabilities = require("lvim.lsp").common_capabilities(),
        default_settings = {
          ["rust-analyzer"] = {
            lens = { enable = true },
            checkOnSave = {
              enable = true,
              command = "clippy",
            },
          },
        },
      },
    }
  end
end

return M
