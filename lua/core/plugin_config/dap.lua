-- Python setup
require('nvim-dap-virtual-text').setup()
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

table.insert(require('dap').configurations.python, {
    name = 'Fast API',
    type = 'python',
    request = 'launch',
    module = 'uvicorn',
    args =  {'app.main:app', '--host', '0.0.0.0', '--port', '80'}
})

require('dapui').setup(
    {
        controls = {
            element = "repl",
            enabled = true,
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = ""
            }
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = "single",
            mappings = {
                close = { "q", "<Esc>" }
            }
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = ""
        },
        layouts = { {
            elements = { {
                id = "scopes",
                size = 0.45
            }, {
                id = "breakpoints",
                size = 0.20
            }, {
                id = "stacks",
                size = 0.15
            }, {
                id = "watches",
                size = 0.20
            } },
            position = "left",
            size = 40
        }, {
            elements = { {
                id = "console",
                size = 1.00
            } },
            position = "bottom",
            size = 10
        } },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t"
        },
        render = {
            indent = 1,
            max_value_lines = 100
        }
    }
)

vim.keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set('n', '<leader>dB', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set('n', '<leader>di', "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set('n', '<leader>dq', "<cmd>lua require'dap'.terminate()<cr>")
vim.keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.open({ height = 10 })<cr>")
vim.keymap.set('n', '<leader>dR', "<cmd>lua require'dap'.repl.close()<cr>")

vim.keymap.set('n', '<leader>duo', "<cmd>lua require'dapui'.open()<cr>")
vim.keymap.set('n', '<leader>duq', "<cmd>lua require'dapui'.close()<cr>")

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
