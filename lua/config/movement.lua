require('leap').opts.safe_labels = { 'f', 'n', 'u', 't' }
vim.keymap.set({ 'n', 'x', 'o' }, 'g', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'G', '<Plug>(leap-backward)')
vim.keymap.set({ 'n' }, '<leader>G', '<Plug>(leap-from-window)')
