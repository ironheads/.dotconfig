return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- zephyr-nvim
    use 'glepnir/zephyr-nvim'

    -- nord theme
    use 'shaunsingh/nord.nvim'
end)
