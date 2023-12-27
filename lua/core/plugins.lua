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
    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { 'nvim-treesitter/playground' },

    -- Undotree
    { 'mbbill/undotree' },

    -- Fugitive for git
    { 'tpope/vim-fugitive' },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Oil for Greasy File Exploration/Management
    { 'stevearc/oil.nvim' },

    -- LSP Plugins
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Leap Motions
    { "ggandor/leap.nvim" },

    -- gruvbox color theme
    { "ellisonleao/gruvbox.nvim" },

    -- DAP Plugins
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python',     dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui",             dependencies = { "mfussenegger/nvim-dap" } },
    { "theHamsta/nvim-dap-virtual-text" },

    -- Commenting
    { "numToStr/Comment.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },

    -- GPT Plugin
    { "robitx/gp.nvim" },
})
