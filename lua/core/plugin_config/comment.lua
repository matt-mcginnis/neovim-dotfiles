require("Comment").setup({
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = false,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
    },
})

-- Toggle current line or with count
vim.keymap.set('n', '<leader>c', function()
    return vim.v.count == 0
        and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true })

-- Toggle in VISUAL mode
vim.keymap.set('x', '<leader>c', '<Plug>(comment_toggle_linewise_visual)')
