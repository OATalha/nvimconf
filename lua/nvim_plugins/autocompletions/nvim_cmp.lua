local M = {}


M.install = function(use)
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "onsails/lspkind.nvim"
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

M.configure = function()

    local cmp_status, cmp = pcall(require, "cmp")
    if not cmp_status then
        return
    end

    local luasnip_status, luasnip = pcall(require, "luasnip")
    if not luasnip_status then
        return
    end

    require("luasnip/loaders/from_vscode").lazy_load()
    require("luasnip/loaders/from_snipmate").lazy_load()

    local autocompletion_off = {
        autocomplete = false,
    }

    local autocompletion_on = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
    }

    local config = {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
            ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        formatting = {
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                vim_item.menu =
                ({
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[NVIM_LUA]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]"
                })[entry.source.name]
                return vim_item
            end
        },
        -- sources for autocompletion
        sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- lsp
            { name = "nvim_lua" }, -- nvim lua
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within current buffer
            { name = "path" }, -- file system paths
        }),
    }

    cmp.setup(config)

    function setAutoCmp(mode)
        if mode then
            config.completion = autocompletion_on
            cmp.setup(config)
        else
            config.completion = autocompletion_off
            cmp.setup(config)
        end
    end

    vim.cmd('command! AutoCmpOn lua setAutoCmp(true)')
    vim.cmd('command! AutoCmpOff lua setAutoCmp(false)')

end

return M
