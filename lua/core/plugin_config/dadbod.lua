vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_save_location = "/Users/mattmcginnis/.local/share/db_ui/"

vim.keymap.set("n", "<leader>eq", ":DBUI<cr>", { desc = "Toggle SQL UI" })

-- Create an augroup for vim-dadbod-ui related autocommands
vim.api.nvim_create_augroup("DadbodUI", { clear = true })

-- Autocmd to unmap Ctrl-j and Ctrl-k for vim-dadbod-ui buffer
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dbui",
    command = [[
        nunmap <buffer> <C-j>
        nunmap <buffer> <C-k>
    ]],
    group = "DadbodUI",
})
