require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "vimls", "ruff", "pylsp", "rust_analyzer" },
    automatic_installation = true
})

local on_attach = function()
    vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = true })
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = true })
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { buffer = true })
    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = true })
    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = true })
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', { buffer = true })
    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = true })
    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = true })
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
                vim.lsp.buf.execute_command({
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
                })
            end,
            description = 'Ruff: Fix all auto-fixable problems.',
        },
        RuffOrganizeImports = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                vim.lsp.buf.execute_command({
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
                })
            end,
            description = 'Ruff: Organize all imports.',
        },
        RuffFormat = {
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                vim.lsp.buf.execute_command({
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
                })
            end,
            description = 'Ruff: Format the file.',
        },
    },
}

require("lspconfig").rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Autocommands
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.cmd("RuffAutoFix")
        vim.cmd("RuffOrganizeImports")
        vim.cmd("sleep 50m")
        vim.cmd("RuffFormat")
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        vim.cmd("RustFmt")
    end,
})
