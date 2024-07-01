vim.g.mapleader = " "

vim.keymap.set({ "i", "n", "v", "s" }, "<c-space>", "<esc>")

vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "h", "k")

vim.keymap.set("n", "<leader>,", "_")
vim.keymap.set("n", "<leader>.", "$")

vim.keymap.set("n", "<leader>b", ":b#<cr>", { desc = "Go to last open buffer" })

vim.keymap.set("n", "<leader>a", "zA", { desc = "Toggle collapsable folds recursively" })
vim.keymap.set("n", "<leader>A", "za", { desc = "Toggle collapsable fold" })
vim.keymap.set("n", "<leader>cr", "zR", { desc = "Open all collapsable folds recursively" })
vim.keymap.set("n", "<leader>cR", "zr", { desc = "Open a collapsable fold" })
vim.keymap.set("n", "<leader>cm", "zM", { desc = "Close all collapsable folds recursively" })
vim.keymap.set("n", "<leader>cM", "zm", { desc = "Close a collapsable fold" })

vim.keymap.set('n', '<leader>ef', function() vim.lsp.buf.format { async = true } end)
vim.keymap.set("n", "<leader>el", ":vnew | term open_ollama_model<cr>", { desc = "Toggle vertical Ollama terminal" })

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

vim.keymap.set("n", "<leader>rj", ":vertical resize -10<cr>", { desc = "Decrease vertical split size" })
vim.keymap.set("n", "<leader>rl", ":vertical resize +10<cr>", { desc = "Increase vertical split size" })
vim.keymap.set("n", "<leader>rk", ":resize -10<cr>", { desc = "Decrease horizontal split size" })
vim.keymap.set("n", "<leader>rh", ":resize +10<cr>", { desc = "Increase horizontal split size" })

vim.keymap.set("n", "<leader>st", ":%s/", { desc = "Sed replace all instances in file" })
vim.keymap.set("n", "<leader>s.", "@:", { desc = "Sed repeat replace all isntances in file" })

vim.keymap.set("n", "<c-.>", "}zz", { desc = "Move up a paragragh" })
vim.keymap.set("n", "<c-,>", "{zz", { desc = "Move down a paragragh" })

vim.keymap.set("n", "<c-j>", "<c-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<c-h>", "<c-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<c-k>", "<c-w>j", { desc = "Move to below split" })

vim.keymap.set("n", "<leader>wJ", "<c-w>H", { desc = "Move split to the left" })
vim.keymap.set("n", "<leader>wL", "<c-w>L", { desc = "Move split to the right" })
vim.keymap.set("n", "<leader>wH", "<c-w>K", { desc = "Move split up" })
vim.keymap.set("n", "<leader>wK", "<c-w>J", { desc = "Move split down" })

vim.keymap.set("n", "<leader>w\\", ":vnew<cr>", { desc = "Create new vertical split" })
vim.keymap.set("n", "<leader>w-", ":new<cr>", { desc = "Create new horizontal split" })

vim.keymap.set("n", "'", "@", { desc = "Run recorded macro" })

-- Writing and Saving
vim.keymap.set("n", "<leader><leader>q", ":q<cr>", { desc = "Regular quit" })
vim.keymap.set("n", "<leader><leader>Q", ":q!<cr>", { desc = "Quit without saving" })
vim.keymap.set("n", "<leader><leader>w", ":w<cr>", { desc = "Regular write/save" })
vim.keymap.set("n", "<leader><leader>W", ":wq<cr>", { desc = "Write/save and quit" })

-- Visual Keymaps
vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "h", "k")

vim.keymap.set("v", "<leader>,", "_")
vim.keymap.set("v", "<leader>.", "$")

vim.keymap.set("v", "<c-.>", "}zz")
vim.keymap.set("v", "<c-,>", "{zz")

vim.keymap.set("v", "H", "<C-u>zz")
vim.keymap.set("v", "K", "<C-d>zz")

vim.keymap.set("v", "p", "\"_dP")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("v", "<leader>st", ":s/")
vim.keymap.set("v", "<leader>s.", "@:")
