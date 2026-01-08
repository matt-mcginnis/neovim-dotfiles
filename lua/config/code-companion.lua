require("codecompanion").setup({
    adapters = {
        http = {
            opts = {
                show_defaults = false,
                show_model_choices = false,
            },
            anthropic = function()
                return require("codecompanion.adapters").extend("anthropic", {
                    name = "anthropic",
                    schema = {
                        model = {
                            default = "claude-sonnet-4-5-20250929",
                        },
                    },
                    env = {
                        api_key = "cmd:op read op://Employee/anthropic_api_key/credential --no-newline",
                    },
                })
            end,
            opus = function()
                return require("codecompanion.adapters").extend("anthropic", {
                    schema = {
                        model = {
                            default = "claude-opus-4-1-20250805",
                        },
                    },
                    env = {
                        api_key = "cmd:op read op://Employee/anthropic_api_key/credential --no-newline",
                    },
                })
            end,
        },
    },
    extensions = {
        mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
                show_result_in_chat = true, -- Show mcp tool results in chat
                make_vars = true,           -- Convert resources to #variables
                make_slash_commands = true, -- Add prompts as /slash commands
            }
        }
    },
    interactions = {
        chat = {
            adapter = "anthropic",
            slash_commands = {
                buffer  = { opts = { contains_code = true, provider = "telescope" } },
                file    = { opts = { contains_code = true, provider = "telescope", max_lines = 1000 } },
                help    = { opts = { contains_code = false, provider = "telescope", max_lines = 128 } },
                symbols = { opts = { contains_code = true, provider = "telescope" } },
            },
            keymaps = {
                options = {
                    modes = {
                        n = "?",
                    },
                    callback = "keymaps.options",
                    description = "Options",
                    hide = true,
                },
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
                yolo_mode = {
                    modes = { n = "sty" },
                    index = 18,
                    callback = "keymaps.yolo_mode",
                    description = "YOLO mode toggle",
                },
                goto_file_under_cursor = {
                    modes = { n = "sR" },
                    index = 19,
                    callback = "keymaps.goto_file_under_cursor",
                    description = "Open the file under cursor in a new tab.",
                },
                -- Keymaps for ACP permission requests
                _acp_allow_always = {
                    modes = { n = "eA" },
                    description = "Allow Always",
                },
                _acp_allow_once = {
                    modes = { n = "ea" },
                    description = "Allow Once",
                },
                _acp_reject_once = {
                    modes = { n = "er" },
                    description = "Reject Once",
                },
                _acp_reject_always = {
                    modes = { n = "eR" },
                    description = "Reject Always",
                },
            }
        },
        cmd = {
            adapter = "anthropic",
        },
        inline = {
            adapter = "anthropic",
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
