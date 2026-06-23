require('leap').opts.safe_labels = { 'f', 'n', 'u', 't' }
vim.keymap.set({ 'n', 'x', 'o' }, 't', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'T', '<Plug>(leap-backward)')
vim.keymap.set({ 'n' }, '<leader>T', '<Plug>(leap-from-window)')
