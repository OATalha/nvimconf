local M = {}

M.install = function(use)
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/nvim-treesitter-context"

end

M.configure = function()
        -- for some bugfix with lsp

    -- import nvim-treesitter plugin safely
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
        return
    end

    -- configure treesitter
    treesitter.setup({
        -- enable syntax highlighting
        highlight = {
            enable = true,
        },
        -- enable indentation
        -- indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
            "python",
            "rst",
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "markdown",
            "svelte",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "toml",
        },
        -- auto install above language parsers
        auto_install = true,
    })

    vim.cmd [[
            set foldmethod=expr
            set foldexpr=nvim_treesitter#foldexpr()
        ]]

    local context_status, context = pcall(require, "nvim-treesitter-context")
    if not context_status then
        return
    end

    context.setup {
        pattern = {
            python = {
                'def',
            }
        }
    }

end

return M
