-- mini files
require('mini.files').setup({
    mappings = {
        close       = 'q',
        go_in       = '>',
        go_in_plus  = '.',
        go_out      = '<',
        go_out_plus = ',',
        reset       = 'u',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = 's',
        trim_left   = '<',
        trim_right  = '>',
    },
})

vim.keymap.set("n", "<c-n>", ":lua MiniFiles.open()<cr>")

-- mini pairs 
require('mini.pairs').setup()

-- mini surround
require('mini.surround').setup({
    -- add custom surroundings to be used on top of builtin ones. for more
    -- information with examples, see `:h minisurround.config`.
    custom_surroundings = nil,

    -- duration (in ms) of highlight when calling `minisurround.highlight()`
    highlight_duration = 500,

    -- module mappings. use `''` (empty string) to disable one.
    mappings = {
        add = '<leader>sa', -- add surrounding in normal and visual modes
        delete = '<leader>sd', -- delete surrounding
        find = '<leader>sf', -- find surrounding (to the right)
        find_left = '<leader>sf', -- find surrounding (to the left)
        highlight = '<leader>sh', -- highlight surrounding
        replace = '<leader>sr', -- replace surrounding
        update_n_lines = '<leader>sn', -- update `n_lines`

        suffix_last = 'l', -- suffix to search with "prev" method
        suffix_next = 'n', -- suffix to search with "next" method
    },

    -- number of lines within which surrounding is searched
    n_lines = 20,

    -- whether to respect selection type:
    -- - place surroundings on separate lines in linewise mode.
    -- - place surroundings on each line in blockwise mode.
    respect_selection_type = false,

    -- how to search for surrounding (first inside current line, then inside
    -- neighborhood). one of 'cover', 'cover_or_next', 'cover_or_prev',
    -- 'cover_or_nearest', 'next', 'prev', 'nearest'. for more details,
    -- see `:h minisurround.config`.
    search_method = 'cover',

    -- whether to disable showing non-error feedback
    silent = false,
})
