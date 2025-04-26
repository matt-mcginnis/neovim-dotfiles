require("codecompanion").setup({
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = {
                        default = "mistral-nemo",
                    },
                },
            })
        end,
        gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
                schema = {
                    model = {
                        default = "gemini-2.0-flash",
                    },
                },
            })
        end,
    },
    strategies = {
        chat = {
            adapter = "gemini",
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
            adapter = "gemini",
        },
        inline = {
            adapter = "gemini",
            keymaps = {
                accept_change = {
                    modes = {
                        n = "ea",
                    },
                    index = 1,
                    callback = "keymaps.accept_change",
                    description = "Accept change",
                },
                reject_change = {
                    modes = {
                        n = "er",
                    },
                    index = 2,
                    callback = "keymaps.reject_change",
                    description = "Reject change",
                },
            },
            prompts = {
                -- The prompt to send to the LLM when a user initiates the inline strategy and it needs to convert to a chat
                inline_to_chat = function(context)
                    return fmt(
                        [[I want you to act as an expert and senior developer in the %s language. I will ask you questions, perhaps giving you code examples, and I want you to advise me with explanations and code where neccessary.]],
                        context.filetype
                    )
                end,
            },
        },
    },
    display = {
        action_palette = {
            provider = "telescope", -- default|telescope|mini_pick
        },
    },
})

vim.api.nvim_set_keymap("n", "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ad", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ac", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ac", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
