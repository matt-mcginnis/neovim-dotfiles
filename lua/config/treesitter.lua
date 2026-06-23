-- nvim-treesitter + nvim-treesitter-textobjects, both on the `main` branch
-- (the Neovim 0.12+ rewrite). On `main`, setup() only takes { install_dir };
-- highlighting is native, parsers install via require('nvim-treesitter').install,
-- and textobjects are wired up with explicit keymaps.

-- Install parsers (no-op if already installed; runs async)
require('nvim-treesitter').install {
  "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
  "python", "hcl", "terraform", "latex", "javascript", "go",
}

-- Native highlighting + experimental treesitter indentation, per buffer
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

require('nvim-treesitter-textobjects').setup {
  select = {
    lookahead = true,
    include_surrounding_whitespace = false,
  },
}

local select = require 'nvim-treesitter-textobjects.select'
local move = require 'nvim-treesitter-textobjects.move'
local repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'

-- Select textobjects
local selections = {
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["ai"] = "@conditional.outer",
  ["ii"] = "@conditional.inner",
  ["ak"] = "@class.outer",
  ["ik"] = "@class.inner",
  ["al"] = "@loop.outer",
  ["il"] = "@loop.inner",
}
for lhs, query in pairs(selections) do
  vim.keymap.set({ "x", "o" }, lhs, function()
    select.select_textobject(query, "textobjects")
  end)
end

-- Movements ('.*' globs from the old config become explicit outer/inner lists)
local conditional = { "@conditional.outer", "@conditional.inner" }
local loop = { "@loop.outer", "@loop.inner" }
local movements = {
  goto_next_start = {
    ["<leader>aF"] = "@function.outer",
    ["<leader>aC"] = "@class.outer",
    ["<leader>a?"] = "@comment.outer",
    ["<leader>aI"] = conditional,
    ["<leader>aL"] = loop,
  },
  goto_next_end = {
    ["<leader>af"] = "@function.outer",
    ["<leader>ac"] = "@class.outer",
    ["<leader>a/"] = "@comment.outer",
    ["<leader>ai"] = conditional,
    ["<leader>al"] = loop,
  },
  goto_previous_start = {
    ["<leader>sf"] = "@function.outer",
    ["<leader>sc"] = "@class.outer",
    ["<leader>s/"] = "@comment.outer",
    ["<leader>si"] = conditional,
    ["<leader>sl"] = loop,
  },
  goto_previous_end = {
    ["<leader>sF"] = "@function.outer",
    ["<leader>sC"] = "@class.outer",
    ["<leader>s?"] = "@comment.outer",
    ["<leader>sI"] = conditional,
    ["<leader>sL"] = loop,
  },
}
for fn, maps in pairs(movements) do
  for lhs, query in pairs(maps) do
    vim.keymap.set({ "n", "x", "o" }, lhs, function()
      move[fn](query, "textobjects")
    end)
  end
end

-- Repeat movement with ; and ,
vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)
