require("codecompanion").setup({
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = {
                        -- default = "deepseek-coder-v2:16b",
                        default = "mistral-nemo",
                    },
                },
            })
        end,
    },
    strategies = {
        agent = {
            adapter = "openai",
        },
        chat = {
            adapter = "openai",
            slash_commands = {
                ["buffer"] = {
                    callback = "strategies.chat.slash_commands.buffer",
                    description = "Insert open buffers",
                    opts = {
                        contains_code = true,
                        provider = "telescope",
                    },
                },
                ["file"] = {
                    callback = "strategies.chat.slash_commands.file",
                    description = "Insert a file",
                    opts = {
                        contains_code = true,
                        max_lines = 1000,
                        provider = "telescope",
                    },
                },
                ["help"] = {
                    callback = "strategies.chat.slash_commands.help",
                    description = "Insert content from help tags",
                    opts = {
                        contains_code = false,
                        max_lines = 128, -- Maximum amount of lines to of the help file to send (NOTE: each vimdoc line is typically 10 tokens)
                        provider = "telescope",
                    },
                },
                ["symbols"] = {
                    callback = "strategies.chat.slash_commands.symbols",
                    description = "Insert symbols for a selected file",
                    opts = {
                        contains_code = true,
                        provider = "telescope",
                    },
                },
            },
        },
        cmd = {
            adapter = "openai",
        },
        inline = {
            adapter = "openai",
        },
    },
    display = {
        action_palette = {
            provider = "telescope", -- default|telescope|mini_pick
        },
    },
})

vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-n>", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ai", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ai", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
