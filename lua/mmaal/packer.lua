-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Fuzzy finder for searching
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Theme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
	-- Syntax Highlighting / Formatting
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- Change tree
	use('mbbill/undotree')
    -- Git Support
	use('tpope/vim-fugitive')
    -- Buffer-level git signs
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Autocompletion & code snippets
    use('hrsh7th/nvim-cmp')         -- Completion engine
    use('hrsh7th/cmp-nvim-lsp')     -- Ensure compatibility with lsp servers so they appear in autocompletion
    use('hrsh7th/cmp-buffer')       -- Enables autocomplete for current buffer
    use('hrsh7th/cmp-path')         -- Enables autocomplete for file system

    use("L3MON4D3/LuaSnip")         -- Snippet engine
    use("saadparwaiz1/cmp_luasnip") -- Luasnip completion source for cmp
    use("hrsh7th/cmp-nvim-lua")     -- complete vim lua configs

    use("rafamadriz/friendly-snippets") -- Adds VSCode like snippets

    -- LSP 
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        { "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced UIs to LSP experience
        "onsails/lspkind.nvim" -- Add VSCode like icons to autocompletion window 
    }
    use 'ray-x/go.nvim'
    -- Status Bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'nvim-tree/nvim-web-devicons'
    use 'sharkdp/fd'
    use 'glepnir/dashboard-nvim'
end)
