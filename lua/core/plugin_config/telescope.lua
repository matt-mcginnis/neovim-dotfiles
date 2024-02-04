vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', ':Telescope git_files<cr>')
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<cr>')
vim.keymap.set('n', '<leader>fs', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fm', ':Telescope marks<cr>')

require('telescope').setup {
    defaults = {
        layout_strategy = "bottom_pane",
        mappings = {
            n = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<c-c>"] = "close",
                ["<c-k>"] = "move_selection_next",
                ["<c-h>"] = "move_selection_previous",
                ["k"] = "move_selection_next",
                ["h"] = "move_selection_previous",
                ["<c-_>"] = "select_horizontal",
                ["<c-\\>"] = "select_vertical",
                ["a"] = "select_all",
                ["A"] = "drop_all",
                ["<c-d>"] = "delete_buffer",
                ["qs"] = "send_selected_to_qflist",
                ["qa"] = "add_selected_to_qflist",
            },
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<c-c>"] = "close",
                ["<c-n>"] = "move_selection_next",
                ["<c-h>"] = "move_selection_previous",
                ["<c-_>"] = "select_horizontal",
                ["<c-\\>"] = "select_vertical",
                ["<c-d>"] = "delete_buffer",
            }
        }
    }
}
