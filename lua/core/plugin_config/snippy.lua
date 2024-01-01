require('snippy').setup({
    mappings = {
        is = {
            ['<c-l>'] = 'expand_or_advance',
            ['<c-j>'] = 'previous',
        },
        nx = {
            ['x'] = 'cut_text',
        },
    },
})
