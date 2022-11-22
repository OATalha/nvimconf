local M = {}

M.install = function(use)
    use "norcalli/nvim-colorizer.lua"
end

M.configure = function()
    status, colorizer = pcall(require, "colorizer")
    if status then
        colorizer.setup()
    end
end

return M
