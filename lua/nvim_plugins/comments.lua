local M = {}

M.install = function(use)
    use {
        "terrortylor/nvim-comment",
    }
end

M.configure = function()
    -- protected load
    local status_ok, nvim_comment = pcall(require, "nvim_comment")
    if status_ok then
        nvim_comment.setup()
    end
end

return M
