vim.g.mapleader = " "

vim.keymap.set("i", "<c-space>", "<esc>")
vim.keymap.set("v", "<c-space>", "<esc>")

vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "h", "k")

vim.keymap.set("n", "<c-j>", "_")
vim.keymap.set("n", "<c-l>", "$")

vim.keymap.set("n", "<leader>ai",  ":vnew | term chatgpt -i<cr>", {desc = "Toggle vertical AI terminal"})
vim.keymap.set("n", "<leader>ao",  ":vnew | term open_ollama_model<cr>", {desc = "Toggle vertical AI terminal"})

vim.keymap.set("n", "<c-.>", ":bnext<cr>", {desc = "Go to next buffer"})
vim.keymap.set("n", "<c-,>", ":bprev<cr>", {desc = "Go to previous buffer"})

vim.keymap.set("n", "<leader>ca", "za", {desc = "Toggle collapsable fold"})
vim.keymap.set("n", "<leader>cr", "zr", {desc = "Open a collapsable fold"})
vim.keymap.set("n", "<leader>cR", "zR", {desc = "Open all collapsable folds recursively"})
vim.keymap.set("n", "<leader>cm", "zm", {desc = "Close a collapsable fold"})
vim.keymap.set("n", "<leader>cM", "zM", {desc = "Close all collapsable folds recursively"})

vim.keymap.set("n", "<c-h>", "<C-u>zz", {desc = "Page down and center"})
vim.keymap.set("n", "<c-k>", "<C-d>zz", {desc = "Page up and center"})

vim.keymap.set("n", "n", "nzzzv", {desc = "Move to next in search and center"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Move to previous in search and center"})

vim.keymap.set("n", "<leader>ob", ":!black .<cr><cr>", {desc = "Open Black for Python formatting"})
vim.keymap.set("n", "<leader>ok", ":Telescope keymaps<cr>", {desc = "Open keymaps with Telescope"})
vim.keymap.set("n", "<leader>og", ":G<cr>", {desc = "Open fugitive for Git"})
vim.keymap.set("n", "<leader>om", ":MarkdownPreviewToggle<cr>", {desc = "Toggle Markdown previews"})

vim.keymap.set("n", "<leader>p", "\"+p", {desc = "Paste from computer register"})

vim.keymap.set("n", "<leader>qo", ":copen<cr>", {desc = "Open quickfix"})
vim.keymap.set("n", "<leader>qn", ":cn<cr>", {desc = "Move to next quickfix"})
vim.keymap.set("n", "<leader>qp", ":cp<cr>", {desc = "Move to previous quickfix"})
vim.keymap.set("n", "<leader>qd", ":cdo ", {desc = "Apply quickfix"})

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

vim.keymap.set("n", "<leader>t\\", ":vnew | term<cr>")
vim.keymap.set("n", "<leader>t-", ":new | term<cr>")
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>v", "<C-v>")

vim.keymap.set("n", "<leader>wj", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>k")
vim.keymap.set("n", "<leader>wk", "<C-w>j")

vim.keymap.set("n", "<leader>wJ", "<C-w>H")
vim.keymap.set("n", "<leader>wL", "<C-w>L")
vim.keymap.set("n", "<leader>wH", "<C-w>K")
vim.keymap.set("n", "<leader>wK", "<C-w>J")

vim.keymap.set("n", "<leader>w\\", ":vnew<cr>")
vim.keymap.set("n", "<leader>w-", ":new<cr>")

vim.keymap.set("n", "<leader>wt", "<C-w>T")

vim.keymap.set("n", "<leader>-", ":sp ")
vim.keymap.set("n", "<leader>\\", ":vsp ")

vim.keymap.set("n", "'", "@")

vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "h", "k")

vim.keymap.set("v", "J", "_")
vim.keymap.set("v", "L", "$")

vim.keymap.set("v", "H", "<C-u>zz")
vim.keymap.set("v", "K", "<C-d>zz")

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
