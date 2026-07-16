-- Commenting via Neovim's built-in commenting (vim._comment). It reads
-- 'commentstring' and is tree-sitter aware, so it works for every filetype
-- with a comment string -- not just those with an installed parser.
-- gc/gcc stay unmapped (deleted in keymaps.lua); only <leader>/ is used.

-- Normal: toggle current line (respects a count, e.g. 3<leader>/)
vim.keymap.set('n', '<leader>/', function()
    return require('vim._comment').operator() .. '_'
end, { expr = true, desc = 'Toggle comment line' })

-- Visual: toggle selected lines
vim.keymap.set('x', '<leader>/', function()
    return require('vim._comment').operator()
end, { expr = true, desc = 'Toggle comment' })

-- .tfvars files get filetype 'terraform-vars', which has no 'commentstring'.
-- Set it so commenting works there too.
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'terraform-vars',
    callback = function()
        vim.bo.commentstring = '# %s'
    end,
})
