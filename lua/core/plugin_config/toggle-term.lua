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
    direction = 'vertical' -- | 'horizontal' | 'tab' | 'float',
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
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
local lazygit = Terminal:new({ cmd = "lazygit", direction="tab", hidden = true })
local mergetool = Terminal:new({ cmd = "git mergetool", direction="tab", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

function _mergetool_toggle()
  mergetool:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>go", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gm", "<cmd>lua _mergetool_toggle()<CR>", {noremap = true, silent = true})
