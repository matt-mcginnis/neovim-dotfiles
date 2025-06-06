require("mcphub").setup()

vim.api.nvim_set_keymap("n", "<c-h>", "<cmd>MCPHub<cr>", { noremap = true, silent = true })
