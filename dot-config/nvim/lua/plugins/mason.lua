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
                                library = vim.list_extend(
                                    vim.api.nvim_get_runtime_file("", true),
                                    { vim.fn.stdpath("data") .. "/lazy/conform.nvim/lua" }
                                ),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false, -- quit spying on me
                            },
                            format = {
                                shiftwidth = 2,
                                tabstop = 2,
                                expandtab = true,
                            },
                        },
                    },
                }, -- Lua moment
                gopls = {},
                ts_ls = {
                    indent = {
                        shiftwidth = 2,
                        tabstop = 2,
                        expandtab = true,
                    }
                },
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
