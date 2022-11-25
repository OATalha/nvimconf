local M = {}

M.install = function(use)
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
end

M.configure = function()

    local status, telescope = pcall(require, "telescope")
    if not status then
        return
    end

    local status, trouble = pcall(require, "trouble.providers.telescope")
    if not status then
        return
    end

    require("telescope").setup({
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key",
                    ["<C-t>"] = trouble.open_with_trouble,
                },
                n = { ["<C-t>"] = trouble.open_with_trouble },
            },
            file_ignore_patterns = { 'bleeding_rez', 'vendor', '_vendor' },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--follow",
            },
        },
        pickers = {
            find_files = {
                follow = true
            }
        },
        extensions = {},
    })

    require('telescope').load_extension('fzf')

    local map = require("nvim_utils").keymap

    -- b maps
    map(
        "n",
        "<leader>bf",
        ":Telescope buffers<CR>",
        { noremap = true, silent = true, desc = "Find Buffers (Telescope)" }
    )

    -- f maps
    map(
        "n",
        "<leader>ff",
        ":Telescope find_files<CR> follow=True",
        { noremap = true, silent = true, desc = "File Finder (Telescope)" }
    )
    map(
        "n",
        "<leader>fg",
        ":Telescope live_grep<CR>",
        { noremap = true, silent = true, desc = "File grep (Telescope)" }
    )
    map(
        "n",
        "<leader>fo",
        ":Telescope oldfiles<CR>",
        { noremap = true, silent = true, desc = "Files: Old (Telescope)" }
    )

    -- s maps
    map("n", "<leader>sg", ":Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Search by Grep" })
    map("n", "<leader>ss", ":Telescope<CR>", { noremap = true, silent = true, desc = "Search by Telescope" })
    map("n", "<leader>sb", ":Telescope marks<CR>", { noremap = true, silent = true, desc = "Search bookmarks" })
    map(
        "n",
        "<leader>sc",
        ":Telescope colorscheme<CR>",
        { noremap = true, silent = true, desc = "Search ColorSchemes" }
    )
end

return M
