require("oil").setup({
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<c-\\>"] = "actions.select_vsplit",
        ["<c-_>"] = "actions.select_split",
        ["<c-t>"] = "actions.select_tab",
        ["<c-p"] = "actions.preview",
        ["<c-c>"] = "actions.close",
        ["<c-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
    }
})

vim.keymap.set({"n", "i"}, "<c-n>", ":Oil .<cr>")
