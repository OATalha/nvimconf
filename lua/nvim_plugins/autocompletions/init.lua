local utils = require("nvim_utils")

vim.o.completeopt = "menu,menuone,noselect,noinsert"

local modules = {
    "nvim_plugins/autocompletions/snippets",
    "nvim_plugins/autocompletions/nvim_cmp",
    "nvim_plugins/autocompletions/lsp",
    "nvim_plugins/autocompletions/null-ls",
    "nvim_plugins/autocompletions/lspsaga",
}

utils.remove_modules(modules)

M = {}

M.install = function (use)
    utils.install_modules(modules, use)
end

M.configure = function ()
    utils.configure_modules(modules)
end

return M
