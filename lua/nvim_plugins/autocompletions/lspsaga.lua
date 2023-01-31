M = {}


M.install = function(use)
    use {"glepnir/lspsaga.nvim", branch="main"}
end


M.configure = function ()

    local status, lspsaga = pcall(require, "lspsaga")
    if not status then
        return
    end

    lspsaga.setup {
        -- code_action_icon = "",
        -- code_action_lightbulb = {
        --     virtual_text = false
        -- }
    }

    require('nvim_plugins/autocompletions/keymaps').lspsaga_keymaps()
end

return M
