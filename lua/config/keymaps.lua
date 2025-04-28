vim.g.mapleader = " "

vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "h", "k")

vim.keymap.set("n", "<", "_", { desc = "Go to beginning of line" })
vim.keymap.set("n", ">", "$", { desc = "Go to end of line" })

vim.keymap.set("n", "<leader>b", ":b#<cr>", { desc = "Go to last open buffer" })

vim.keymap.set("n", "<leader>d", ":RenderMarkdown toggle<cr>", { desc = "Toggle markdown render" })

vim.keymap.set("n", "<leader>ta", "zA", { desc = "Toggle collapsable folds recursively" })
vim.keymap.set("n", "<leader>tA", "za", { desc = "Toggle collapsable fold" })
vim.keymap.set("n", "<leader>tr", "zR", { desc = "Open all collapsable folds recursively" })
vim.keymap.set("n", "<leader>tR", "zr", { desc = "Open a collapsable fold" })
vim.keymap.set("n", "<leader>tm", "zM", { desc = "Close all collapsable folds recursively" })
vim.keymap.set("n", "<leader>tM", "zm", { desc = "Close a collapsable fold" })

vim.keymap.set('n', '<leader>ef', function() vim.lsp.buf.format { async = true } end)

vim.keymap.set("n", "H", "<C-u>zz", { desc = "Page up and center" })
vim.keymap.set("n", "K", "<C-d>zz", { desc = "Page down and center" })

vim.keymap.set("n", "<leader>h", ":set hlsearch! hlsearch?<cr>", { desc = "Toggle search highlight" })

vim.keymap.set("n", "<c-m>", "m", { desc = "Set mark" })
vim.keymap.set("n", "m", "`", { desc = "Go to mark" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next in search and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous in search and center" })

vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from computer register" })

vim.keymap.set("n", "<leader>qo", ":copen<cr>", { desc = "Open quickfix" })
vim.keymap.set("n", "<leader>qn", ":cn<cr>", { desc = "Move to next quickfix" })
vim.keymap.set("n", "<leader>qp", ":cp<cr>", { desc = "Move to previous quickfix" })
vim.keymap.set("n", "<leader>qd", ":cdo ", { desc = "Apply quickfix" })
vim.keymap.set("n", "<leader>qc", ":cexpr []<cr>", { desc = "Clear quickfix" })
vim.keymap.set("n", "<leader>qq", ":cq<cr>", { desc = "Quit quickfix" })

vim.keymap.set("n", "<c-9>", ":vertical resize -10<cr>", { desc = "Decrease horizontal split size" })
vim.keymap.set("n", "<c-0>", ":vertical resize +10<cr>", { desc = "Increase horizontal split size" })

vim.keymap.set("n", "<leader>st", ":%s/", { desc = "Sed replace all instances in file" })
vim.keymap.set("n", "<leader>s.", "@:", { desc = "Sed repeat replace all isntances in file" })

vim.keymap.set("n", "<c-.>", "}zz", { desc = "Move up a paragragh" })
vim.keymap.set("n", "<c-,>", "{zz", { desc = "Move down a paragragh" })

vim.keymap.set("n", "<leader>wj", "<c-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>wl", "<c-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<leader>wh", "<c-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<leader>wk", "<c-w>j", { desc = "Move to below split" })

vim.keymap.set("n", "<leader>wJ", "<c-w>H", { desc = "Move split to the left" })
vim.keymap.set("n", "<leader>wL", "<c-w>L", { desc = "Move split to the right" })
vim.keymap.set("n", "<leader>wH", "<c-w>K", { desc = "Move split up" })
vim.keymap.set("n", "<leader>wK", "<c-w>J", { desc = "Move split down" })

vim.keymap.set("n", "<leader>wt", "<c-w>T", { desc = "Move split to its own window" })

vim.keymap.set("n", "<leader>w\\", ":vnew<cr>", { desc = "Create new vertical split" })
vim.keymap.set("n", "<leader>w-", ":new<cr>", { desc = "Create new horizontal split" })

vim.keymap.set("n", "'", "@", { desc = "Run recorded macro" })

vim.keymap.set("n", "<leader>to", ":silent !wezterm cli spawn --cwd $(pwd) -- lazygit<CR>")

-- Visual Keymaps
vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "h", "k")

vim.keymap.set("v", "<", "_", { desc = "Go to beginning of line" })
vim.keymap.set("v", ">", "$", { desc = "Go to end of line" })

vim.keymap.set("v", "<c-.>", "}zz", { desc = "Move up a paragragh" })
vim.keymap.set("v", "<c-,>", "{zz", { desc = "Move down a paragragh" })

vim.keymap.set("v", "H", ":m '<-2<CR>gv=gv", { desc = "Move highlighted block up" })
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv", { desc = "Move highlighted block down" })

vim.keymap.set("v", "p", "\"_dP", { desc = "Paste and retain what was pasted" })
vim.keymap.set("v", "<leader>p", "\"+p", { desc = "Paste from computer register" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to computer register" })

vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

vim.keymap.set("v", "<leader>st", ":s/", { desc = "Sed replace in selected instance" })
vim.keymap.set("v", "<leader>s.", "@:", { desc = "Sed repeat replace in selected instance" })
