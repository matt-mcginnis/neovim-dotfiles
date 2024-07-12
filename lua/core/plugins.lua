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
    -- Try loading Treesitter first
    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    -- { 'nvim-treesitter/playground' },

    -- Autocompletion and Snippets
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "dcampos/nvim-snippy" },
    { "dcampos/cmp-snippy" },
    { "matt-mcginnis/vim-snippets" },

    -- Commenting
    { "numToStr/Comment.nvim" },

    -- Dadbod
    {
      'kristijanhusak/vim-dadbod-ui',
      dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
      },
      cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
      },
    },

    -- DAP Plugins
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python',     dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { "theHamsta/nvim-dap-virtual-text" },

    -- GPT Plugin
    { "robitx/gp.nvim" },

    -- Gruvbox Color Theme
    { "ellisonleao/gruvbox.nvim" },

    -- Leap Motions
    { "ggandor/leap.nvim" },

    -- LSP Plugins
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
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

    -- Toggle Term
    { 'akinsho/toggleterm.nvim', version = "*", config = true },

    -- Undotree
    { 'mbbill/undotree' }
})
