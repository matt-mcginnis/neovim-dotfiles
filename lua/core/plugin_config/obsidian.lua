require("obsidian").setup({
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        workspaces = {
            {
                name = "work",
                path = "~/vaults/work",
            },
            {
                name = "personal",
                path = "~/vaults/personal",
            },
        },

        -- Optional, for templates (see below).
        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {},
        },
    })

vim.keymap.set("n", "<leader>og", ":ObsidianFollowLink<cr>")
vim.keymap.set("v", "<leader>ol", ":ObsidianLink<cr>")
vim.keymap.set("v", "<leader>oL", ":ObsidianLinkNew<cr>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew<cr> dip:ObsidianTemplate<cr>")
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<cr>")
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<cr>")
vim.keymap.set("n", "<leader>off", ":ObsidianQuickSwitch<cr>")
vim.keymap.set("n", "<leader>ofs", ":ObsidianSearch<cr>")
vim.keymap.set("n", "<leader>owp", ":ObsidianWorkspace personal<cr>")
vim.keymap.set("n", "<leader>oww", ":ObsidianWorkspace work<cr>")
