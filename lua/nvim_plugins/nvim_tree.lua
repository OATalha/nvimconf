local M = {}

M.install = function(use)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
end

M.configure = function()
    local status, nvimtree = pcall(require, "nvim-tree")
    if not status then
        print('could not load nvim tree')
        return
    end

    nvimtree.setup {
        view = {
            adaptive_size = true,
        }
    }

    keymap = require('nvim_utils').keymap

    keymap("n", "<leader>ft", ":NvimTreeToggle<CR>", {noremap = true})
    keymap("n", "<leader>fd", ":NvimTreeFindFile<CR>", {noremap = true})

    require("nvim_utils").update_which_key_maps {
        f = {
            name = "file",
            t = {name = "File Tree / Toggle"},
            d = {name = "File Tree / Find File"}
        }
    }
end


return M
