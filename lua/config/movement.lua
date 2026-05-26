require('leap').opts.safe_labels = { 'f', 'n', 'u', 't' }
vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
vim.keymap.set({ 'n' }, '<leader>F', '<Plug>(leap-from-window)')
