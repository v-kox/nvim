local def = require("plugins.lsp.default-config")

require("lspconfig").bashls.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
    }
)

require("lspconfig").sqls.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
    }
)

require("lspconfig").jqls.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
    }
)

require("lspconfig").dockerls.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
        settings = {
            docker = {
                languageserver = {
                    formatter = {
                        ignoreMultilineInstructions = true,
                    },
                },
            }
        }
    }
)

require("lspconfig").docker_compose_language_service.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
    }
)

require("lspconfig").jsonls.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
    }
)

require("lspconfig").lua_ls.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = {
                    globals = { "vim" }, -- Ignore `vim` warnings in neovim config
                },
                hint = { enable = true },
                signatureHelp = { enable = true },
                telemetry = { enable = false },
            },
        },
    }
)

require("lspconfig").pyright.setup(
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
        hint = { enable = true },
        settings = {
            python = {
                analysis = {
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                }
            }
        }
    }
)

require("lspconfig").yamlls.setup {
    {
        on_attach = def.on_attach,
        capabilities = def.capabilities,
        filetypes = { "yaml", "yml" },
        flags = { debounce_test_changes = 150 },
        settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
                format = {
                    enable = true,
                    bracketSpacing = true,
                    singleQuote = true,
                    printWidth = 80,
                },
                hover = true,
                completion = true,
                validate = true,
            },
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["http://json.schemastore.org/github-action"] = { ".github/action.{yml,yaml}" },
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { ".gitlab-ci.{yml,yaml}" }
            },
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
            },
        },
    },
}
