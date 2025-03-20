require("toggleterm").setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    open_mapping = [[<c-t>]],
    direction = 'horizontal' -- 'vertical' | 'horizontal' | 'tab' | 'float',
}

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Lazygit Setup
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit   = Terminal:new({ cmd = "lazygit", direction = "tab", hidden = true })
local mergetool = Terminal:new({ cmd = "git mergetool", direction = "tab", hidden = true })
local yazi = Terminal:new({ cmd = "yazi", direction = "tab", hidden = true })

function _Yazi_Toggle()
    yazi:toggle()
end

function _Lazygit_Toggle()
    lazygit:toggle()
end

function _Mergetool_Toggle()
    mergetool:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>te", "<cmd>lua _Yazi_Toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>lua _Lazygit_Toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tx", "<cmd>lua _Mergetool_Toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
