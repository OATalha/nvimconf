local M = {}

M.install = function(use)
    use { "neovim/nvim-lspconfig" }
    use { "hrsh7th/cmp-nvim-lsp" } -- lsp - completer glue
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
end

M.configure = function()
    -- import lspconfig plugin safely
    local lspconfig_status, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status then
        return
    end

    -- import cmp-nvim-lsp plugin safely
    local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not cmp_nvim_lsp_status then
        return
    end

    -- loading lsp installer
    local mason_status, mason = pcall(require, "mason")
    if not mason_status then
        return
    end

    -- installer config bridge
    local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_lspconfig_status then
        return
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    ---@diagnostic disable-next-line: unused-local
    local on_attach = function(client, bufnr)
    end

    mason.setup()

    mason_lspconfig.setup()

    mason_lspconfig.setup_handlers {
        function(server_name)
            lspconfig[server_name].setup {
                on_attach = on_attach,
                capabilities = capabilities
            }
        end,
    }

    require("nvim_plugins/autocompletions/keymaps").lsp_keymaps()
    require("nvim_plugins/autocompletions/diagnostics")()

end

return M
