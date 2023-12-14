local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-n>"] = "close",
                ["<C-k>"] = "move_selection_next",
                ["<C-h>"] = "move_selection_previous",
                ["k"] = "move_selection_next",
                ["h"] = "move_selection_previous",
                ["<C-_>"] = "select_horizontal",
                ["<C-\\>"] = "select_vertical",
                ["a"] = "select_all",
                ["A"] = "drop_all",
                ["dd"] = "delete_buffer",
                ["qs"] = "send_selected_to_qflist",
                ["qa"] = "add_selected_to_qflist",
            },
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-n>"] = "close",
                ["<C-k>"] = "move_selection_next",
                ["<C-h>"] = "move_selection_previous",
                ["<C-_>"] = "select_horizontal",
                ["<C-\\>"] = "select_vertical",
            }
        }
    }
}
