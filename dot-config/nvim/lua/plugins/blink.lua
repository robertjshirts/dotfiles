return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            }
        }
    },
	{
		"saghen/blink.cmp",
		dependencies = {
			"neovim/nvim-lspconfig", -- Required for LSP integration
			"L3MON4D3/LuaSnip",      -- Snippet engine
			"rafamadriz/friendly-snippets", -- Predefined snippets
		},
		version = '*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = 'default' },
            sources = {
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    }
                }
            }
		}
	}
}
