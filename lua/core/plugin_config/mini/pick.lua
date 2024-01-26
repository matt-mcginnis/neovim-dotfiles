require('mini.pick').setup({
    -- Keys for performing actions. See `:h MiniPick-actions`.
    mappings = {
        caret_left  = '<Left>',
        caret_right = '<Right>',

        choose            = '<CR>',
        choose_in_split   = '<C-_>',
        choose_in_tabpage = '<C-t>',
        choose_in_vsplit  = '<C-\\>',
        choose_marked     = '<M-CR>',

        delete_char       = '<BS>',
        delete_char_right = '<Del>',
        delete_left       = '',
        delete_word       = '',

        mark     = '',
        mark_all = '',

        move_down  = '<C-k>',
        move_start = '<C-g>',
        move_up    = '<C-h>',

        paste = '<C-p>',

        refine        = '',
        refine_marked = '',

        scroll_down  = '<C-d>',
        scroll_left  = '<C-j>',
        scroll_right = '<C-l>',
        scroll_up    = '<C-u>',

        stop = '<Esc>',

        toggle_info    = '<S-Tab>',
        toggle_preview = '<Tab>',
    },
})

vim.keymap.set('n', '<leader>ff', ":Pick files<cr>", {})
vim.keymap.set('n', '<leader>fg', ":Pick files tool='git'<cr>", {})
vim.keymap.set('n', '<leader>fs', ":Pick grep_live<cr>", {})
vim.keymap.set('n', '<leader>fb', ":Pick buffers<cr>", {})
