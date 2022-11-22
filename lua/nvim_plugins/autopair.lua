local M = {}

M.install = function(use)
    use "windwp/nvim-autopairs"
end

M.configure = function()
    status, autopair = pcall(require, "nvim-autopairs")
    if not status then
        return
    end
    require("nvim-autopairs").setup {
        check_ts = true
    }
end

return M
