vim.g.netrw_liststyle = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.diagnostic.config({ signs = false, virtual_text = false })

-- Trying to set up autoformat with Black

--vim.api.nvim_buf_get_name(0)

-- vim.cmd([[
-- augroup format_on_save
--     au!
--     au BufWritePre *.py !black .
-- augroup END
-- ]], false)
