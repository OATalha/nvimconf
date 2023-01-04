vim.cmd [[filetype plugin indent on]]

vim.g.mapleader = ' '

-- for nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- file and edit options 
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.whichwrap = vim.o.whichwrap .. '<,>,[,]'
vim.o.mouse = 'a'
vim.o.virtualedit = 'all'
vim.cmd [[ set isfname-== ]]

-- file opening settings
vim.opt.suffixesadd:append('.lua')
vim.opt.path:append('lua/')
vim.opt.isfname:remove('=')

-- indent options
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.textwidth = 78
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.shiftround = true

-- fold options
vim.o.foldenable = true
vim.o.foldlevel = 100   -- Unfold at start
vim.o.foldopen = 'block,hor,mark,percent,quickfix,tag'
vim.o.foldlevelstart = 99

-- search options
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- wild menu settings
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.wildignore = '*.o,*.obj,*~,*.pyc'

-- encoding
vim.o.fileencoding = 'utf-8'

-- register
vim.o.fixeol = true

