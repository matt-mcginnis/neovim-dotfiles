local fzf = require('fzf-lua')

vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fg', fzf.git_files)
vim.keymap.set('n', '<leader>fk', fzf.keymaps)
vim.keymap.set('n', '<leader>fs', fzf.live_grep)
vim.keymap.set('n', '<leader>fe', fzf.buffers)
vim.keymap.set('n', '<leader>fm', fzf.marks)

fzf.setup {
    -- bottom-pane style: a real split at the bottom instead of a float
    winopts = {
        split = "belowright new",
    },
    keymap = {
        fzf = {
            ["ctrl-j"] = "down",
            ["ctrl-k"] = "up",
            ["ctrl-a"] = "select-all",
        },
    },
    actions = {
        files = {
            ["enter"]  = fzf.actions.file_edit_or_qf,
            ["ctrl-h"] = fzf.actions.file_split,
            ["ctrl-v"] = fzf.actions.file_vsplit,
            ["ctrl-t"] = fzf.actions.file_tabedit,
            ["ctrl-q"] = fzf.actions.file_sel_to_qf,
        },
    },
    buffers = {
        actions = {
            ["ctrl-d"] = { fn = fzf.actions.buf_del, reload = true },
        },
    },
}
