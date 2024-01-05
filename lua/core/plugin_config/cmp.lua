-- Set up snippy
require("snippy").setup({
    mappings = {
        is = {
            ["<c-l>"] = "expand_or_advance",
            ["<c-j>"] = "previous",
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
        ["<c-h>"] = cmp.mapping.scroll_docs(-4),
        ["<c-k>"] = cmp.mapping.scroll_docs(4),
        ["<c-o>"] = cmp.mapping.complete(),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
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
        { name = "nvim_lsp" },
        { name = "snippy" },
    }, {
        { name = "buffer" },
    }),
})
