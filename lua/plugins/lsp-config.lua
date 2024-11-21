return {
"neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local masonlsp = require("mason-lspconfig")
        mason.setup()
        masonlsp.setup({
        ensure_installed = {
            "bashls",
            "jqls",
            "jsonls",
            "marksman",
            "lua_ls",
            "pyright",
            "sqls",
            "yamlls",
        },
        })
        require("plugins.lsp.lsp-servers")
    end
}

