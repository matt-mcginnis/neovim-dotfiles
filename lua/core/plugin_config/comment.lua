require("Comment").setup({
    mappings = {
        basic = false,
        extra = false,
    },
})

-- Toggle current line or with count
vim.keymap.set('n', '<leader>/', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true })

-- Toggle in VISUAL mode
vim.keymap.set('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)')
