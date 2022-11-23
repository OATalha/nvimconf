local M = {}


M.install = function(use)
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
end


M.configure = function()
    -- import null-ls plugin safely
    local setup, null_ls = pcall(require, "null-ls")
    if not setup then
        return
    end

    -- for conciseness
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters ()

    null_ls.setup({
        debug = false,
        sources = {
            diagnostics.flake8,
            formatting.black,
        },
    })

    require('nvim_plugins/autocompletions/keymaps').nullls_keymaps()

end


return M
