vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'puremourning/vimspector'
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    -- use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-lua/plenary.nvim')
    use('ThePrimeagen/harpoon')
    use('tpope/vim-fugitive')
    use {
        "puremourning/vimspector",
        cmd = { "VimspectorInstall", "VimspectorUpdate" },
        fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
        config = function()
            require("config.vimspector").setup()
        end,
    }
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
        },
        use('preservim/nerdtree'),
        use('tpope/vim-commentary'),
        -- use('jiangmiao/auto-pairs'),
        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        },
        use {
            'lewis6991/gitsigns.nvim',
            tag = 'release',
        },
        use('morhetz/gruvbox'),
        use('sainnhe/sonokai'),
        use('navarasu/onedark.nvim'),
        use {
            -- Add indentation guides even on blank lines
            'lukas-reineke/indent-blankline.nvim',
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help indent_blankline.txt`
            opts = {
                char = '┊',
                show_trailing_blankline_indent = false,
            },
        },
    }

    vim.cmd('colorscheme rose-pine')
end)
