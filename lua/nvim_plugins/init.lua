local utils = require("nvim_utils")

-- auto install packer if not installed
local packer_bootstrap = utils.ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */nvim_plugins/*.lua source $MYVIMRC | PackerSync
  augroup end
]])


local modules = {
    'nvim_plugins/colorscheme',
    'nvim_plugins/indentguides',
    'nvim_plugins/comments',
    'nvim_plugins/startup',
    'nvim_plugins/terminal',
    'nvim_plugins/bufkill',
    'nvim_plugins/dcc',
    'nvim_plugins/sneak',
    'nvim_plugins/lualine',
    -- 'nvim_plugins/bufferline',
    'nvim_plugins/nerdtree',
    -- 'nvim_plugins/nvim_tree',
    'nvim_plugins/autopair',
    'nvim_plugins/colorizer',
    'nvim_plugins/gitsigns',
    'nvim_plugins/which_key',
}
utils.remove_modules(modules)

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

packer.startup(
    function(use)
        use "wbthomason/packer.nvim"
        use "tpope/vim-surround"
        use "tpope/vim-repeat"
        use "tpope/vim-unimpaired"
        use "tpope/vim-fugitive"

        utils.install_modules(modules, use)

        if packer_bootstrap then
            require("packer").sync()
        end
    end
)

-- now configure all modules with settings
utils.configure_modules(modules)
