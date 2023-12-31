require('mini.files').setup({
  mappings = {
    close       = 'q',
    go_in       = 'L',
    go_in_plus  = 'l',
    go_out      = 'J',
    go_out_plus = 'j',
    reset       = '<BS>',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = 's',
    trim_left   = '<',
    trim_right  = '>',
  },
})

vim.keymap.set("n", "<c-n>", ":lua MiniFiles.open()<cr>")
