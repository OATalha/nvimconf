return {
    install = function (use)
        use 'lewis6991/impatient.nvim'
    end,
    configure = function ()
        -- configure
        status, impatient = pcall(require, 'impatient')
        if not status then
            return
        end
        impatient.enable_profile()
    end
}
