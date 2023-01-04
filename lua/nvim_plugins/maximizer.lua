local map = require("nvim_utils").keymap

M = {}

M.install = function(use)
    use 'declancm/maximize.nvim'
end


M.configure = function()
    local status, maximize = pcall(require, 'maximize')
    if not status then
        return
    end
    maximize.setup {
        default_keymaps = false
    }
    map("n", "<Leader>wz", "<CMD>lua require('maximize').toggle()<CR>", {noremap = true, desc="Window / Maximize"})
end


return M
