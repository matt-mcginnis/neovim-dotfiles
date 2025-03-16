vim.cmd.colorscheme("rose-pine")

vim.g.netrw_liststyle = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.splitright = true

vim.opt.foldmethod = "indent"

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.diagnostic.config({ signs = false, virtual_text = false })

vim.opt.conceallevel = 1
