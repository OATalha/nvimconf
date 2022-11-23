#!/usr/bin/env lua


local M = {}


M.install = function (use)
    use {"L3MON4D3/LuaSnip", tag = "v1.*"}
    use {"saadparwaiz1/cmp_luasnip"}
    use {"rafamadriz/friendly-snippets"}
    use {"honza/vim-snippets"}
    use {'stevearc/vim-vscode-snippets'}
    -- use {"sgouda0412/vim-snippets-1"}
end

M.configure = function ()
end


return M
