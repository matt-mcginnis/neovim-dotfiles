local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
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
        tag = '0.1.1',
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

    -- Gruvbox Color Theme
    { "ellisonleao/gruvbox.nvim" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { 'nvim-treesitter/playground' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },

    -- LSP Plugins
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Installation
            { 'L3MON4D3/LuaSnip' },
            {
                'hrsh7th/nvim-cmp',
                config = function()
                    require 'cmp'.setup {
                        snippet = {
                            expand = function(args)
                                require 'luasnip'.lsp_expand(args.body)
                            end
                        },
                    }
                end
            },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        }
    },

    -- DAP Plugins
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python',   dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui",           dependencies = { "mfussenegger/nvim-dap" } },
    { "theHamsta/nvim-dap-virtual-text" },

    -- Leap Motions
    { "ggandor/leap.nvim" },
    { "ggandor/flit.nvim" },

    -- Oil for Greasy File Exploration/Management
    { 'stevearc/oil.nvim' },

    -- Open AI
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    }
})
