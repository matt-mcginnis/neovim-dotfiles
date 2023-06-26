-- Language Server Protocol Configuration
local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = true
    }
})

lsp.nvim_workspace()

lsp.ensure_installed({
    'lua_ls',
    'sqlls',
    'vimls',
    'pylsp'
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr, omit = { 'K' }, })
    vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = true })
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { buffer = true })
    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = true })
    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = true })
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', { buffer = true })
    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = true })
    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = true })
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['pylsp'] = { 'python' },
    }
})

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})
