vim.g.mapleader = " "

vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "h", "k")

vim.keymap.set("n", "<leader>j", "_")
vim.keymap.set("n", "<leader>l", "$")

vim.keymap.set("n", "H", "Hzz")
vim.keymap.set("n", "K", "Lzz")

vim.keymap.set("n", "<leader>ai", "O<cr><cr><esc>kk:ChatGPT ")

vim.keymap.set("n", "<leader>ca", "za")
vim.keymap.set("n", "<leader>cr", "zr")
vim.keymap.set("n", "<leader>cR", "zR")
vim.keymap.set("n", "<leader>cm", "zm")
vim.keymap.set("n", "<leader>cM", "zM")

vim.keymap.set("n", "<C-h>", "<C-u>zz")
vim.keymap.set("n", "<C-k>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>mt", "`")
vim.keymap.set("n", "<leader>md", ":delm ")

vim.keymap.set("n", "<leader>ni", ":Neorg workspace notes<cr>")
vim.keymap.set("n", "<leader>nr", ":Neorg return<cr>")
vim.keymap.set("n", "<leader>ns", ":Neorg sync-parsers<cr>")

vim.keymap.set("n", "<leader>op", ":!black .<cr><cr>")

vim.keymap.set("n", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>rj", ":vertical resize -10<cr>")
vim.keymap.set("n", "<leader>rl", ":vertical resize +10<cr>")
vim.keymap.set("n", "<leader>rh", ":resize +10<cr>")
vim.keymap.set("n", "<leader>rk", ":resize -10<cr>")

vim.keymap.set("n", "<leader>s'", "ciw'<esc>pa'<esc>")
vim.keymap.set("n", "<leader>s\"", "ciw\"<esc>pa\"<esc>")
vim.keymap.set("n", "<leader>s(", "ciw(<esc>pa)<esc>")
vim.keymap.set("n", "<leader>s)", "ciw(<esc>pa)<esc>")
vim.keymap.set("n", "<leader>s[", "ciw[<esc>pa]<esc>")
vim.keymap.set("n", "<leader>s]", "ciw[<esc>pa]<esc>")
vim.keymap.set("n", "<leader>s{", "ciw{<esc>pa}<esc>")
vim.keymap.set("n", "<leader>s}", "ciw{<esc>pa}<esc>")
vim.keymap.set("n", "<leader>st", ":%s/")
vim.keymap.set("n", "<leader>s.", "@:")

vim.keymap.set("n", "<C-e>", "gt")
vim.keymap.set("n", "<C-n>", "gT")
vim.keymap.set("n", "<C-.>", ":tabm +1<cr>")
vim.keymap.set("n", "<C-,>", ":tabm -1<cr>")

vim.keymap.set("n", "<leader>wj", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>k")
vim.keymap.set("n", "<leader>wk", "<C-w>j")

vim.keymap.set("n", "<leader>wJ", "<C-w>H")
vim.keymap.set("n", "<leader>wL", "<C-w>L")
vim.keymap.set("n", "<leader>wH", "<C-w>K")
vim.keymap.set("n", "<leader>wK", "<C-w>J")

vim.keymap.set("n", "<leader>wt", "<C-w>T")

vim.keymap.set("n", "<leader>-", ":sp ")
vim.keymap.set("n", "<leader>\\", ":vsp ")

vim.keymap.set("n", "'", "@")

vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "h", "k")

vim.keymap.set("v", "H", "Hzz")
vim.keymap.set("v", "K", "Lzz")

vim.keymap.set("v", "<leader>j", "_")
vim.keymap.set("v", "<leader>l", "$")

vim.keymap.set("v", "mf", ":norm mf<cr>")

vim.keymap.set("v", "p", "\"_dP")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("v", "<leader>op", ":!black .<cr><cr>")
vim.keymap.set("v", "<leader>ot", "gq")

vim.keymap.set("v", "<leader>s'", "c'<esc>pa'<esc>")
vim.keymap.set("v", "<leader>s\"", "c\"<esc>pa\"<esc>")
vim.keymap.set("v", "<leader>s(", "c(<esc>pa)<esc>")
vim.keymap.set("v", "<leader>s)", "c(<esc>pa)<esc>")
vim.keymap.set("v", "<leader>s[", "c[<esc>pa]<esc>")
vim.keymap.set("v", "<leader>s]", "c[<esc>pa]<esc>")
vim.keymap.set("v", "<leader>s{", "c{<esc>pa}<esc>")
vim.keymap.set("v", "<leader>s}", "c{<esc>pa}<esc>")
vim.keymap.set("v", "<leader>st", ":s/")
vim.keymap.set("v", "<leader>s.", "@:")

vim.keymap.set("v", "<leader>/", "y/\\V<C-R>=escape(@\",'/\')<CR><CR>")
