local M = {}

function M.setup()
	require("plugins.config.crates")
	require("plugins.config.fidget")
	require("plugins.config.rust-tools")
	require("plugins.config.telescope")

	lvim.plugins = {
		{ "j-hui/fidget.nvim", opts = require("plugins.config.fidget").setup() },
		{ "notjedi/nvim-rooter.lua", event = "BufRead" },
		{ "phaazon/hop.nvim", event = "BufRead" },
		{ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
		{ "sindrets/diffview.nvim", event = "BufRead" },
		{ "f-person/git-blame.nvim", event = "BufRead" },
		{ "pwntester/octo.nvim" },
		{ "tpope/vim-fugitive" },
		{ "windwp/nvim-ts-autotag" },
		-- { "ray-x/lsp_signature.nvim" },
		{ "simrat39/symbols-outline.nvim" },
		{ "karb94/neoscroll.nvim", event = "WinScrolled" },
		{ "nushell/tree-sitter-nu" },
		{ "milanglacier/minuet-ai.nvim" },
		{ "folke/trouble.nvim", opts = require("plugins.config.trouble").setup() },
		{ "nvim-telescope/telescope-project.nvim", event = "BufWinEnter" },
		{ "folke/todo-comments.nvim", event = "BufRead", opts = {} },
		{ "nvim-telescope/telescope-dap.nvim" },
    { "mrcjkb/rustaceanvim", init = function() require("plugins.config.rust-tools").setup() end, ft = { "rust", "rs" }, enabled = true },
    { "saecki/crates.nvim", version = "v0.3.0", dependencies = { "nvim-lua/plenary.nvim" }, },
    { "rayliwell/tree-sitter-rstml", dependencies = { "nvim-treesitter" }, build = ":TSUpdate", opts = {} },
    { "rayliwell/nvim-ts-autotag", opts = {} },
    { "nvim-pack/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
    { "sidebar-nvim/sidebar.nvim" },
    { "p00f/clangd_extensions.nvim" },
    { "tzachar/cmp-tabnine", build = "pwsh.exe ./install.ps1", dependencies = "hrsh7th/nvim-cmp", event = "InsertEnter" },
	}
end

return M
