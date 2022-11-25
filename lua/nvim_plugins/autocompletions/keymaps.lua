local keymap = require('nvim_utils').keymap

M.lsp_keymaps = function()

    require "nvim_utils".update_which_key_maps {
        l = {
            name = "language / LSP",
        }
    }

    keymap("n", "<leader>lK", "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        { noremap = true, silent = true, desc = "Signature Help" })
    keymap("n", "<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
        { noremap = true, silent = true, desc = "Add Workspace Folder" })
    keymap("n", "<leader>lW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
        { noremap = true, silent = true, desc = "Remove Workspace Folder" })
    keymap("n", "<leader>ll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        { noremap = true, silent = true, desc = "List Workspace Folders" })
    keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        { noremap = true, silent = true, desc = "Type Definition" })
    keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>",
        { noremap = true, silent = true, desc = "Go To Definition" })
    keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>",
        { noremap = true, silent = true, desc = "Go To Declaration" })
    keymap("n", "<leader>ls", "<cmd>lua vim.cmd('rightbelow vsplit'); vim.lsp.buf.definition()<cr>",
        { noremap = true, silent = true, desc = "Split and Go To Definition" })
    keymap("n", "<leader>lS", "<cmd>lua vim.cmd('rightbelow vsplit'); vim.lsp.buf.declaration()<cr>",
        { noremap = true, silent = true, desc = "Split and Go To Declaration" })
    keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>",
        { noremap = true, silent = true, desc = "References" })
    keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.document_highlight()<cr>",
        { noremap = true, silent = true, desc = "Doc Highlight" })
    keymap("n", "<leader>lH", "<cmd>lua vim.lsp.buf.document_highlight_kind()<cr>",
        { noremap = true, silent = true, desc = "Doc Highlight Kind" })
    keymap("n", "<leader>lc", "<cmd>lua vim.lsp.buf.clear_references()<cr>",
        { noremap = true, silent = true, desc = "Highlight kind" })


    keymap("n", "<leader>li", ":LspInfo<cr>", { noremap = true, silent = true, desc = "Info" })
    keymap("n", "<leader>lI", ":Mason<CR>", { noremap = true, silent = true, desc = "LInstall Info", })
end

M.lspsaga_keymaps = function()
    keymap("n", "<leader>lF", "<cmd>Lspsaga lsp_finder<cr>", { noremap = true, silent = true, desc = "lsp_finder" })
    keymap("n", "<leader>lk", "<cmd>Lspsaga hover_doc<cr>", { noremap = true, silent = true, desc = "Hover Commands" })
    keymap("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { noremap = true, silent = true, desc = "Code Action" })
    keymap("n", "<leader>lR", "<cmd>Lspsaga rename<cr>", { noremap = true, silent = true, desc = "Rename" })
    keymap("n", "<leader>le", "<cmd>Lspsaga show_line_diagnostics<cr>",
        { noremap = true, silent = true, desc = "Line Diagnostics" })
    keymap("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<cr>",
        { noremap = true, silent = true, desc = "Cursor Diagnostics" })
    keymap("n", "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<cr>",
        { noremap = true, silent = true, desc = "Next Diagnostic" })
    keymap("n", "<leader>lN", "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        { noremap = true, silent = true, desc = "Prev Diagnostic" })
    keymap("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>",
        { noremap = true, silent = true, desc = "Peek Definition" })
end


M.nullls_keymaps = function()
    require("nvim_utils").keymap(
        "n",
        "<leader>lf",
        "<cmd>lua vim.lsp.buf.format { async = true }<cr>",
        { noremap = true, silent = true, desc = "Format" }
    )

    require("nvim_utils").keymap(
        "x",
        "<leader>lf",
        "<esc><cmd>lua vim.lsp.buf.format {async = true }<cr>",
        { noremap = true, silent = true, desc = "Range Format" }
    )
end

return M
