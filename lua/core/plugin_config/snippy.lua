require("snippy").setup({
    mappings = {
        is = {
            ["<c-.>"] = "expand_or_advance",
            ["<c-,>"] = "previous",
        },
        nx = {
            ["<leader>x"] = "cut_text",
        },
    },
})
