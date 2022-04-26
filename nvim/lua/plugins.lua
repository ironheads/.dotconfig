return require('packer').startup(function()
    -- Packer can manage itself
    use '~/.vim/plugins/packer.nvim'

    -- zephyr-nvim
    use '~/.vim/plugins/zephyr-nvim'

    -- nord theme
    use '~/.vim/plugins/nord.nvim'

    -- coc.nvim
    use { '~/.vim/plugins/coc.nvim' }
    
    -- nvim-tree
    use {
        '~/.vim/plugins/nvim-tree.lua',
        requires = '~/.vim/plugins/nvim-web-devicons'
    }

    -- bufferline
    use {'~/.vim/plugins/bufferline.nvim', requires = '~/.vim/plugins/nvim-web-devicons'}

    -- treesitter
    use { '~/.vim/plugins/nvim-treesitter', run = ':TSUpdate' }
end)
