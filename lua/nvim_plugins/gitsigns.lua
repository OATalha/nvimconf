local M = {}

M.install = function(use)
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }
end

M.configure = function()
    status, gitsigns = pcall(require, "gitsigns")
    if status then
        gitsigns.setup()
    end
end

return M
