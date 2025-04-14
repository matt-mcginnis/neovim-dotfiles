require("oil").setup({
    default_file_explorer = true,
    keymaps = {
        ["s?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["ss"] = { "actions.change_sort", mode = "n" },
        ["sx"] = "actions.open_external",
        ["s."] = { "actions.toggle_hidden", mode = "n" },
        ["s\\"] = { "actions.toggle_trash", mode = "n" },
    },
})

vim.keymap.set("n", "<leader>fn", "<CMD>Oil<CR>", { desc = "Open parent directory" })
