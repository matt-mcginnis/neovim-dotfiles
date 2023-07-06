require('leap').opts.safe_labels = { 'f', 'n', 'u', 't' }
vim.keymap.set({ 'n', 'x', 'o' }, 't', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-backward-to)')
vim.keymap.set({ 'n' }, '<leader>t', '<Plug>(leap-from-window)')

require('flit').setup {
    keys = { f = 'f', F = 'F', t = '^', T = '^' },
    -- A string like "nv", "nvo", "o", etc.
    labeled_modes = "v",
    multiline = true,
    -- Like `leap`s similar argument (call-specific overrides).
    -- E.g.: opts = { equivalence_classes = {} }
    opts = {}
}
