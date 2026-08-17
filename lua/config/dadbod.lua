-- Dadbod UI settings
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"

-- dadbod-ui ships no duckdb table helpers (its default List is an empty
-- query). Merged over defaults, so this survives plugin updates.
-- Formatted to match the plugin's postgres helpers (lowercase keywords,
-- uppercase LIMIT/constraint queries). See also the shadowed adapter in
-- autoload/db/adapter/duckdb.vim.
vim.g.db_ui_table_helpers = {
    duckdb = {
        List = 'select * from "{table}" LIMIT 200',
        Columns = "select * from pragma_table_info('{table}')",
        Indexes = "SELECT * FROM duckdb_indexes() where table_name = '{table}'",
        ["Primary Keys"] = "SELECT constraint_type, constraint_column_names FROM duckdb_constraints() WHERE table_name = '{table}' AND constraint_type = 'PRIMARY KEY'",
    },
}

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
