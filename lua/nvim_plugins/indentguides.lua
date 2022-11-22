local M = {}

M.install = function(use)
    use "lukas-reineke/indent-blankline.nvim"
end

M.configure = function()
    local status, indent_blankline = pcall(require, "indent_blankline")
    if not status then
        return
    end
    require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
        buftype_exclude = {"terminal"},
        filetype_exclude = {"dashboard", "NERDTree", "packer", "alpha"}
    }
end

return M
