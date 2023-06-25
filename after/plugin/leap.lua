require('leap').opts.safe_labels = { 'f', 'n', 'u', 't' }
vim.keymap.set({ 'n', 'x', 'o' }, 't', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 'T', '<Plug>(leap-backward-to)')
vim.keymap.set({ 'n' }, '<leader>t', '<Plug>(leap-from-window)')
