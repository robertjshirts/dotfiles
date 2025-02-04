return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = {
								enable = false, -- quit spying on me
							},
						},
					},
				}, -- Lua moment
				gopls = {},
				ts_ls = {},
			}
			require("mason-lspconfig").setup {
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
			}

			local lspconfig = require("lspconfig")
			for server, config in pairs(servers) do
				lspconfig[server].setup(config)
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
	},
}

