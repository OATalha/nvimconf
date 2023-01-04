local M = {}

M.install = function(use)
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                window = {
                    border = "single",
                },
                layout = {
                    align = "center",
                },
            }
        end
    }
end

M.register = function()
    local status, which_key = pcall(require, "which-key")
    if not status then
        print("whichkey could not be loaded")
        return
    end
    local utils = require("nvim_utils")
    which_key.register(
        utils.get_which_key_maps(), {prefix = "<leader>"})
    which_key.register(
        utils.get_which_key_maps("x"), {mode = "x", prefix = "<leader>"})
end

M.configure = function()
    vim.o.timeoutlen = 1000

    local status, which_key = pcall(require, "which-key")
    if not status then
        print("whichkey could not be loaded")
        return
    end

    local mappings = {
        f = {
            name = "file"
        },
        e = {
            name = "edit"
        },
        s = {
            name = "select/search"
        },
        b = {
            name = "buffers"
        },
        w = {
            name = "windows"
        }
    }

    local utils = require("nvim_utils")
    utils.update_which_key_maps(mappings)


    M.register()
end

return M
