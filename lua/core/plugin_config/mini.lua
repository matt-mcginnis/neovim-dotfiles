require('mini.files').setup(
-- No need to copy this inside `setup()`. Will be used automatically.
{
    -- Customization of shown content
    content = {
        -- Predicate for which file system entries to show
        filter = nil,
        -- What prefix to show to the left of file system entry
        prefix = nil,
        -- In which order to show file system entries
        sort = nil,
    },

    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
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
        trim_left   = 'j',
        trim_right  = 'l',
    },

    -- General options
    options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = true,
    },

    -- Customization of explorer windows
    windows = {
        -- Maximum number of windows to show side by side
        max_number = math.huge,
        -- Whether to show preview of file/directory under cursor
        preview = false,
        -- Width of focused window
        width_focus = 50,
        -- Width of non-focused window
        width_nofocus = 15,
        -- Width of preview window
        width_preview = 25,
    },
}
)

vim.keymap.set("n", "<c-n>", ":lua MiniFiles.open()<cr>")
