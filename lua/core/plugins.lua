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
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Search directories first with telescope
    {
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("dir-telescope").setup({
                -- these are the default options set
                hidden = true,
                no_ignore = false,
                show_preview = true,
            })
        end,
    },

    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Gruvbox Color Theme
    { "ellisonleao/gruvbox.nvim" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { 'nvim-treesitter/playground' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },

    -- LSP Plugins
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Autocompletion and Snippets
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "matt-mcginnis/my-snippets" }
    },
    { "saadparwaiz1/cmp_luasnip" },

    -- DAP Plugins
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python',     dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui",             dependencies = { "mfussenegger/nvim-dap" } },
    { "theHamsta/nvim-dap-virtual-text" },

    -- Leap Motions
    { "ggandor/leap.nvim" },

    -- Commenting
    { "numToStr/Comment.nvim" },

    -- Oil for Greasy File Exploration/Management
    { 'stevearc/oil.nvim' },

    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },
})
