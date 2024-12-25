require 'nvim-treesitter.configs'.setup {
  -- Said this was a required property...
  modules = {},

  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
            },
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["<leader>tF"] = "@function.outer",
                ["<leader>tC"] = "@class.outer",
                ["<leader>t?"] = "@comment.outer",
                ["<leader>tI"] = "@conditional.*",
                ["<leader>tL"] = "@loop.*",
            },
            goto_next_end = {
                ["<leader>tf"] = "@function.outer",
                ["<leader>tc"] = "@class.outer",
                ["<leader>t/"] = "@comment.outer",
                ["<leader>ti"] = "@conditional.*",
                ["<leader>tl"] = "@loop.*",
            },
            goto_previous_start = {
                ["<leader>sf"] = "@function.outer",
                ["<leader>sc"] = "@class.outer",
                ["<leader>s/"] = "@comment.outer",
                ["<leader>si"] = "@conditional.*",
                ["<leader>sl"] = "@loop.*",
            },
            goto_previous_end = {
                ["<leader>sF"] = "@function.outer",
                ["<leader>sC"] = "@class.outer",
                ["<leader>s?"] = "@comment.outer",
                ["<leader>sI"] = "@conditional.*",
                ["<leader>sL"] = "@loop.*",
            },
        },
    },
}

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- Optionally, make builtin f, F also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
