require("codecompanion").setup({
    adapters = {
        opts = {
            show_defaults = false,
            show_model_choices = false,
        },
        anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
                name = "anthropic",
                schema = {
                    model = {
                        default = "claude-sonnet-4-20250514",
                    },
                },
            })
        end,
        flash = function()
            return require("codecompanion.adapters").extend("gemini", {
                name = "flash",
                schema = {
                    model = {
                        default = "gemini-2.5-flash-preview-05-20",
                    },
                },
            })
        end,
        gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
                name = "gemini",
                schema = {
                    model = {
                        default = "gemini-2.5-pro-preview-05-06",
                    },
                },
            })
        end,
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = {
                        default = "mistral-nemo",
                    },
                },
            })
        end,
        openai = function()
            return require("codecompanion.adapters").extend("openai", {
                schema = {
                    model = {
                        default = "gpt-4.1",
                    },
                },
            })
        end,
    },
    extensions = {
        mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
                show_result_in_chat = true, -- Show mcp tool results in chat
                make_vars = true,   -- Convert resources to #variables
                make_slash_commands = true, -- Add prompts as /slash commands
            }
        }
    },
    strategies = {
        chat = {
            adapter = "flash",
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
            -- tools = {
            --     ["mcp"] = {
            --         -- calling it in a function would prevent mcphub from being loaded before it's needed
            --         callback = function() return require("mcphub.extensions.codecompanion") end,
            --         description = "Call tools and resources from the MCP Servers",
            --     }
            -- },
            keymaps = {
                options = {
                    modes = {
                        n = "?",
                    },
                    callback = "keymaps.options",
                    description = "Options",
                    hide = true,
                },
                -- completion = {
                --     modes = {
                --         i = "",
                --     },
                --     index = 1,
                --     callback = "keymaps.completion",
                --     description = "Completion Menu",
                -- },
                send = {
                    modes = {
                        n = { "<CR>", "<C-Space>" },
                        i = "<C-Space>",
                    },
                    index = 2,
                    callback = "keymaps.send",
                    description = "Send",
                },
                regenerate = {
                    modes = {
                        n = "sr",
                    },
                    index = 3,
                    callback = "keymaps.regenerate",
                    description = "Regenerate the last response",
                },
                close = {
                    modes = {
                        n = "<C-c>",
                        i = "<C-c>",
                    },
                    index = 4,
                    callback = "keymaps.close",
                    description = "Close Chat",
                },
                stop = {
                    modes = {
                        n = "q",
                    },
                    index = 5,
                    callback = "keymaps.stop",
                    description = "Stop Request",
                },
                clear = {
                    modes = {
                        n = "sx",
                    },
                    index = 6,
                    callback = "keymaps.clear",
                    description = "Clear Chat",
                },
                codeblock = {
                    modes = {
                        n = "sc",
                    },
                    index = 7,
                    callback = "keymaps.codeblock",
                    description = "Insert Codeblock",
                },
                yank_code = {
                    modes = {
                        n = "sy",
                    },
                    index = 8,
                    callback = "keymaps.yank_code",
                    description = "Yank Code",
                },
                pin = {
                    modes = {
                        n = "sp",
                    },
                    index = 9,
                    callback = "keymaps.pin_reference",
                    description = "Pin Reference",
                },
                watch = {
                    modes = {
                        n = "sw",
                    },
                    index = 10,
                    callback = "keymaps.toggle_watch",
                    description = "Watch Buffer",
                },
                next_chat = {
                    modes = {
                        n = "s0",
                    },
                    index = 11,
                    callback = "keymaps.next_chat",
                    description = "Next Chat",
                },
                previous_chat = {
                    modes = {
                        n = "s9",
                    },
                    index = 12,
                    callback = "keymaps.previous_chat",
                    description = "Previous Chat",
                },
                next_header = {
                    modes = {
                        n = "s.",
                    },
                    index = 13,
                    callback = "keymaps.next_header",
                    description = "Next Header",
                },
                previous_header = {
                    modes = {
                        n = "s,",
                    },
                    index = 14,
                    callback = "keymaps.previous_header",
                    description = "Previous Header",
                },
                change_adapter = {
                    modes = {
                        n = "sm",
                    },
                    index = 15,
                    callback = "keymaps.change_adapter",
                    description = "Change adapter",
                },
                fold_code = {
                    modes = {
                        n = "sf",
                    },
                    index = 15,
                    callback = "keymaps.fold_code",
                    description = "Fold code",
                },
                debug = {
                    modes = {
                        n = "sd",
                    },
                    index = 16,
                    callback = "keymaps.debug",
                    description = "View debug info",
                },
                system_prompt = {
                    modes = {
                        n = "ss",
                    },
                    index = 17,
                    callback = "keymaps.toggle_system_prompt",
                    description = "Toggle the system prompt",
                },
                auto_tool_mode = {
                    modes = {
                        n = "sta",
                    },
                    index = 18,
                    callback = "keymaps.auto_tool_mode",
                    description = "Toggle automatic tool mode",
                },
                goto_file_under_cursor = {
                    modes = { n = "sR" },
                    index = 19,
                    callback = "keymaps.goto_file_under_cursor",
                    description = "Open the file under cursor in a new tab.",
                },
            }
        },
        cmd = {
            adapter = "flash",
        },
        inline = {
            adapter = "flash",
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

vim.api.nvim_set_keymap("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>an", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>an", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ai", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
