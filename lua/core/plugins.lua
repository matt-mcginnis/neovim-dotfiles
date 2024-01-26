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

    -- Autocompletion and Snippets
    { "dcampos/nvim-snippy" },
    { "matt-mcginnis/vim-snippets" },

    -- GPT Plugin
    { "robitx/gp.nvim" },

    -- Toggle Term
    { 'akinsho/toggleterm.nvim', version = "*", config = true },

    -- Obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
    },

    -- Follow Markdown Links
    { "jghauser/follow-md-links.nvim" },

    -- Mini
    { 'echasnovski/mini.nvim', version = '*' }
})
