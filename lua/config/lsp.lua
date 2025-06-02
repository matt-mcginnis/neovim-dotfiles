require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "vimls", "ruff", "pylsp", "rust_analyzer" },
    automatic_enable = true,
    automatic_installation = true
})

local on_attach = function()
    vim.keymap.set('n', 'sd', '<cmd>Telescope lsp_definitions<cr>')
    vim.keymap.set('n', 'sh', '<cmd>lua vim.lsp.buf.hover()<cr>')
    vim.keymap.set('n', 'si', '<cmd>Telescope lsp_implementations<cr>')
    vim.keymap.set('n', 'sr', '<cmd>Telescope lsp_references<cr>')
    vim.keymap.set('n', 'sc', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set('n', 'sn', '<cmd>lua vim.lsp.buf.rename()<cr>')
    vim.keymap.set('n', 'sl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    vim.keymap.set('n', 's.', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    vim.keymap.set('n', 's,', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
                enable = false
            }
        }
    }
}

require("lspconfig").pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').ruff.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        RuffAutoFix = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local ruff_client = vim.lsp.get_clients({ name = 'ruff' })[1]
                ruff_client:exec_cmd({
                    title = "Auto-fix",
                    command = "ruff.applyAutofix",
                    arguments = {
                        {
                            uri = vim.uri_from_bufnr(0),
                            version = assert(
                                vim.lsp.util.buf_versions[bufnr],
                                ('No version found for buffer %d'):format(bufnr)
                            )
                        },
                    }
                },
                { bufnr = bufnr })
            end,
            description = 'Ruff: Fix all auto-fixable problems.',
        },
        RuffOrganizeImports = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local ruff_client = vim.lsp.get_clients({ name = 'ruff' })[1]
                ruff_client:exec_cmd({
                    title = "Organize imports",
                    command = "ruff.applyOrganizeImports",
                    arguments = {
                        {
                            uri = vim.uri_from_bufnr(0),
                            version = assert(
                                vim.lsp.util.buf_versions[bufnr],
                                ('No version found for buffer %d'):format(bufnr)
                            )
                        },
                    }
                },
                { bufnr = bufnr })
            end,
            description = 'Ruff: Organize all imports.',
        },
        RuffFormat = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local ruff_client = vim.lsp.get_clients({ name = 'ruff' })[1]
                ruff_client:exec_cmd({
                    title = "Format",
                    command = "ruff.applyFormat",
                    arguments = {
                        {
                            uri = vim.uri_from_bufnr(0),
                            version = assert(
                                vim.lsp.util.buf_versions[bufnr],
                                ('No version found for buffer %d'):format(bufnr)
                            )
                        },
                    }
                },
                { bufnr = bufnr })
            end,
            description = 'Ruff: Format the file.',
        },
    },
}

require("lspconfig").rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.cmd("silent RuffOrganizeImports")
        vim.cmd("silent sleep 20m")
        vim.cmd("silent RuffAutoFix")
        vim.cmd("silent sleep 20m")
        vim.cmd("silent RuffFormat")
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        vim.cmd("RustFmt")
    end,
})
