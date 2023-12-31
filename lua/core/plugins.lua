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

    -- Autocompletion and Snippets
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "matt-mcginnis/my-snippets" }
    },
    { "saadparwaiz1/cmp_luasnip" },

    -- GPT Plugin
    { "robitx/gp.nvim" },

    -- Toggle Term
    { 'akinsho/toggleterm.nvim', version = "*", config = true },

    -- Mini capabilities
    { 'echasnovski/mini.nvim', version = '*' },
})
