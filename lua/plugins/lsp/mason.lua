return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        -- Active mason et personnalise les icônes
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_enable = true,
            -- List des serveurs possibles : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
            ensure_installed = {
                "ada-language-server", -- Ada
                "clangd",              -- c/c++
                "cmake",
                "crystalline",
                "cssls",
                "elmls",
                "graphql",
                "html",
                "lua_ls",
                "pylsp",         -- python
                "ruff",
                "rust_analyzer", -- rust
                "sqlls",
                "svelte",
                "ts_ls",
                "tinymist",
                "yamlls",
            },
        })
    end,
}
