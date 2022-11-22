local M = {}

M.install = function(use)
    use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
end

M.configure = function()
    status, lualine = pcall(require, "lualine")
    if not status then
        print("lualine could not be loaded")
        return
    end

    lualine.setup(
        {
            theme = "gruvbox"
        }
    )
end

return M
