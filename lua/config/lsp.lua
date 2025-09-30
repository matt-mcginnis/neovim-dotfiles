require("mason").setup()

local on_attach = function()
    vim.keymap.set('n', 'sh', ':lua vim.lsp.buf.hover()<cr>')
    vim.keymap.set('n', 'sd', ':Telescope lsp_definitions<cr>')
    vim.keymap.set('n', 'si', ':Telescope lsp_implementations<cr>')
    vim.keymap.set('n', 'sr', ':Telescope lsp_references<cr>')
    vim.keymap.set('n', 'ss', ':Telescope lsp_document_symbols<cr>')
    vim.keymap.set('n', 'sc', ':lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set('n', 'sn', ':lua vim.lsp.buf.rename()<cr>')
    vim.keymap.set('n', 'sl', ':lua vim.diagnostic.open_float()<cr>')
    vim.keymap.set('n', 's.', ':lua vim.diagnostic.goto_prev()<cr>')
    vim.keymap.set('n', 's,', ':lua vim.diagnostic.goto_next()<cr>')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config.lua_ls = {
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

vim.lsp.config.clangd = {
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.config.pylsp = {
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.config.ruff = {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        RuffAutoFix = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local ruff_client = vim.lsp.get_clients({ name = 'ruff' })[1]
                if ruff_client then
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
                end
            end,
            description = 'Ruff: Fix all auto-fixable problems.',
        },
        RuffOrganizeImports = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local ruff_client = vim.lsp.get_clients({ name = 'ruff' })[1]
                if ruff_client then
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
                end
            end,
            description = 'Ruff: Organize all imports.',
        },
        RuffFormat = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local ruff_client = vim.lsp.get_clients({ name = 'ruff' })[1]
                if ruff_client then
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
                end
            end,
            description = 'Ruff: Format the file.',
        },
    },
}

vim.lsp.config.rust_analyzer = {
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

