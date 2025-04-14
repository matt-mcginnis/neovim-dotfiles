vim.g.codeium_disable_bindings = 1

-- Keep the existing Codeium bindings
vim.keymap.set('i', '<c-e>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-o>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
vim.keymap.set('n', '<leader>co', '<cmd>lua vim.g.codeium_enabled = false<cr>', { silent = true })
vim.keymap.set('n', '<leader>cO', '<cmd>lua vim.g.codeium_enabled = true<cr>', { silent = true })
