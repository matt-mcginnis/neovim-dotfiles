-- Dadbod UI settings
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"

-- Completion in SQL buffers
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "plsql" },
    callback = function()
        local cmp = require("cmp")
        cmp.setup.buffer({
            sources = cmp.config.sources({
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            }),
        })
    end,
})

-- No indent folding in drawer and result buffers
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dbui", "dbout" },
    callback = function()
        vim.opt_local.foldenable = false
    end,
})

vim.keymap.set("n", "<leader>ui", ":DBUIToggle<cr>", { desc = "Toggle database UI" })
vim.keymap.set("n", "<leader>ub", ":DBUIFindBuffer<cr>", { desc = "Find database buffer" })
vim.keymap.set("n", "<leader>ua", ":DBUIAddConnection<cr>", { desc = "Add database connection" })
