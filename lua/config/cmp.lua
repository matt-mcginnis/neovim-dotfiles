-- Set up snippy
require("snippy").setup({
    mappings = {
        is = {
            ["<c-o>"] = "expand_or_advance",
            ["<c-i>"] = "previous",
        },
        nx = {
            ["<leader>x"] = "cut_text",
        },
    },
})

-- Set up cmp
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<tab>"] = cmp.mapping.scroll_docs(-4),
        ["<s-tab>"] = cmp.mapping.scroll_docs(4),
        ["<c-t>"] = cmp.mapping.complete(),
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
        ["<c-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<c-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    -- REQUIRED - you must specify a snippet engine
    snippet = {
        expand = function(args)
            require("snippy").expand_snippet(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "snippy" },
        { name = "codeium" },
    }, {
        { name = "buffer" },
    }),
})
