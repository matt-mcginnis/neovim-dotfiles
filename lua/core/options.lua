vim.g.netrw_liststyle = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tw = 120

vim.opt.splitright = true

vim.opt.foldmethod = "indent"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.diagnostic.config({ signs = false, virtual_text = false })

-- Vimwiki Settings
vim.g.vimwiki_folding = 'custom'

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {'*.wiki'},
    group = group,
    command = 'setlocal nowrap'
})

