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
