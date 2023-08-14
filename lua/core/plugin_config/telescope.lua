local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})


vim.keymap.set("n", "<leader>ds", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>df", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

require("telescope").load_extension("dir")
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["k"] = "move_selection_next",
                ["h"] = "move_selection_previous",
                ["t"] = "select_tab",
                ["-"] = "select_horizontal",
                ["\\"] = "select_vertical"
            }
        }
    }
}
