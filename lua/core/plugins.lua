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

    -- GPT Plugin
    { "robitx/gp.nvim" },

    -- Rose-pine Color Theme
    { "rose-pine/neovim",                 name = "rose-pine" },

    -- Leap Motions
    { "ggandor/leap.nvim" },

    -- LSP Plugins
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Toggle Term
    { 'akinsho/toggleterm.nvim',          version = "*",     config = true },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = ":TSUpdate",
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

    { "nvim-treesitter/nvim-treesitter-textobjects" },

    -- Markdown Render
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    }
})
