-- Kulala loads on http/rest filetypes; setup and keymaps stay buffer-local
local configured = false

-- No indent folding in kulala's explorer and response buffers
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "kulala_openapi", "kulala_ui" },
    callback = function()
        vim.opt_local.foldenable = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "http", "rest" },
    callback = function(event)
        local kulala = require("kulala")

        if not configured then
            kulala.setup({
                default_env = "local",
                -- LLM-backed endpoints (chat) run long; default 60s too tight
                timeout = 180000,
            })
            configured = true
        end

        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map("<leader>rs", kulala.run, "Send request under cursor")
        map("<leader>ro", function()
            local src_win = vim.api.nvim_get_current_win()
            kulala.open_openapi_explorer()
            -- explorer takes focus on success; close the originating .http window
            if vim.bo.filetype == "kulala_openapi" and vim.api.nvim_win_is_valid(src_win) then
                vim.api.nvim_win_close(src_win, false)
            end
        end, "Open OpenAPI explorer, close this window")
        map("<leader>ra", kulala.run_all, "Send all requests in buffer")
        map("<leader>rr", kulala.replay, "Replay last request")
        map("<leader>re", kulala.set_selected_env, "Select environment")
        map("<leader>ri", kulala.inspect, "Inspect request under cursor")
        map("<leader>rq", kulala.close, "Close response window")
    end,
})
