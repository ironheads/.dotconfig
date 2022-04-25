return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- zephyr-nvim
    use '~/.vim/plugins/zephyr-nvim'

    -- nord theme
    use '~/.vim/plugins/nord.nvim'
end)
