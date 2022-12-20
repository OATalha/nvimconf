M = {}

M.install = function(use)
    use 'declancm/maximize.nvim'
end


M.configure = function()
    local status, maximize = pcall(require, 'maximize')
    if not status then
        return
    end
    maximize.setup()
end


return M
