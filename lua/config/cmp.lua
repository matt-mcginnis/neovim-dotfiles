-- Set up snippy
require("snippy").setup({})

-- Set up cmp
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<c-.>"] = cmp.mapping.scroll_docs(-4),
        ["<c-,>"] = cmp.mapping.scroll_docs(4),
        ["<c-t>"] = cmp.mapping.complete(),
        ["<c-e>"] = cmp.mapping.confirm({ select = false }),
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
    }),
    performance = {
        -- It is recommended to increase the timeout duration due to
        -- the typically slower response speed of LLMs compared to
        -- other completion sources. This is not needed when you only
        -- need manual completion.
        fetching_timeout = 1000,
    },
})
