-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("dir-telescope").setup({
                -- these are the default options set
                hidden = true,
                no_ignore = false,
                show_preview = true,
            })
        end,
    })

    use { "ellisonleao/gruvbox.nvim" }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use { 'nvim-treesitter/playground' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }

    -- LSP Plugins
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- Add in VS Code snippets
    use { "rafamadriz/friendly-snippets" }

    -- DAP Plugins
    use { 'mfussenegger/nvim-dap' }
    use { 'mfussenegger/nvim-dap-python', requires = { "mfussenegger/nvim-dap" } }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use("theHamsta/nvim-dap-virtual-text")

    -- Leap Motions
    use("ggandor/leap.nvim")
    use("ggandor/flit.nvim")

    -- Oil for Greasy File Exploration/Management
    use { 'stevearc/oil.nvim' }

    -- Open AI
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })
end)
