-- Python setup
require('nvim-dap-virtual-text').setup()
require('dap-go').setup()
require('dap-python').setup('uv')

require('dap').adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

require('dap').configurations.rust = require('dap').configurations.rust or {}
table.insert(require('dap').configurations.rust, {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false
})

table.insert(require('dap').configurations.python, {
    name = 'Fast API',
    type = 'python',
    request = 'launch',
    module = 'fastapi',
    console = 'integratedTerminal',
    args = function()
        local host = vim.fn.input("Host: ", "127.0.0.1")
        local port = vim.fn.input("Port: ", "8000")
        return { 'dev', 'app/main.py', '--host', host, '--port', port }
    end
})

table.insert(require('dap').configurations.python, {
    name = 'Fast API (uvicorn)',
    type = 'python',
    request = 'launch',
    module = 'uvicorn',
    console = 'integratedTerminal',
    args = function()
        local host = vim.fn.input("Host: ", "127.0.0.1")
        local port = vim.fn.input("Port: ", "8000")
        return { 'app.main:app', '--host', host, '--port', port }
    end
})

table.insert(require('dap').configurations.python, {
    name = 'App Tests',
    type = 'python',
    request = 'launch',
    module = 'app.tests.${fileBasenameNoExtension}'
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
                id = "repl",
                size = 0.5
            }, {
                id = "watches",
                size = 0.5
            } },
            position = "left",
            size = 50
        }, {
            elements = { {
                id = "console",
                size = 1
              } },
            position = "bottom",
            size = 15
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
