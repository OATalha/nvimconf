return {
    install = function(use)
        use 'rcarriga/nvim-notify'
    end,

    configure = function()
        local status, notify = pcall(require, "notify")
        if not status then
            return
        end
        vim.notify = notify
    end,
}
