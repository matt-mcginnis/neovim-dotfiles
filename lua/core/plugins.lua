local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Autocompletion and Snippets
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "dcampos/nvim-snippy" },
    { "dcampos/cmp-snippy" },
    { "matt-mcginnis/vim-snippets" },

    -- Commenting
    { "numToStr/Comment.nvim" },

    -- Rose-pine Color Theme
    { "rose-pine/neovim",                           name = "rose-pine" },

    -- Leap Motions
    { "ggandor/leap.nvim" },

    -- LSP Plugins
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Toggle Term
    { 'akinsho/toggleterm.nvim',                    version = "*",     config = true },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = "0.1.5",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        }
    },

    -- Markdown Render
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },

    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "hrsh7th/nvim-cmp",    -- autocompletion for avante commands and mentions
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
})
