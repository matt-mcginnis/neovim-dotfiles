require("oil").setup({
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<leader>o\\"] = "actions.select_vsplit",
        ["<leader>o-"] = "actions.select_split",
        ["<leader>ot"] = "actions.select_tab",
        ["<leader>op"] = "actions.preview",
        ["<leader>oc"] = "actions.close",
        ["<leader>or"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
    }
})

vim.keymap.set("n", "<leader>oi", ":Oil .<cr>")
