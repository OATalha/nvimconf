return {
    install = function(use)
        use "morhetz/gruvbox"
        use "rakr/vim-one"
        use "ayu-theme/ayu-vim"
        use "marko-cerovac/material.nvim"
        use 'bluz71/vim-nightfly-colors'
    end,
    configure = function()
        vim.o.background = "dark"
        vim.o.termguicolors = true
        vim.g.ayucolor="mirage"   -- "mirage", light", "dark"
        vim.g.material_style = "deep ocean" --"deep ocean", "oceanic", "palenight", "lighter", "darker"
        status, _ = pcall(vim.cmd, [[ colorscheme nightfly ]])
        if not status then
            vim.cmd('colorscheme desert')
        end
    end
}
