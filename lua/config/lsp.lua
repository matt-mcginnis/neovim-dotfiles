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

-- Extract Ruff command functions for direct use
local function ruff_organize_imports()
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
end

local function ruff_auto_fix()
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
end

local function ruff_format()
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
end

-- Note: Assignment syntax, not function call
vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
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
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.config.pylsp = {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.config.ruff = {
    cmd = { 'ruff', 'server', '--preview' },
    filetypes = { 'python' },
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.config.rust_analyzer = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    on_attach = on_attach,
    capabilities = capabilities
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        ruff_organize_imports()
        vim.defer_fn(function()
            ruff_auto_fix()
            vim.defer_fn(function()
                ruff_format()
            end, 20)
        end, 20)
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        vim.cmd("RustFmt")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.lsp.enable('rust_analyzer')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.lsp.enable('lua_ls')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function()
        vim.lsp.enable('clangd')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.lsp.enable('pylsp')
        vim.lsp.enable('ruff')
    end,
})
