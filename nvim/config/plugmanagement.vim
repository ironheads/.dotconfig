" use packer to manage plugins
if has('nvim')
    lua require('plugins')
    lua require('plugin-config/nvim-treesitter')
endif
