map = require("nvim_utils").keymap

-- moving from terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, desc = "Exit Terminal Mode" })
map("t", "<C-Esc>", "<C-\\><C-n>", { noremap = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true })
map("t", "<C-w>", "<C-\\><C-n><C-w>", { noremap = true })

-- moving in windows
map("", "<c-j>", "<c-w>j", { noremap = true })
map("", "<c-h>", "<c-w>h", { noremap = true })
map("", "<c-k>", "<c-w>k", { noremap = true })
map("", "<c-l>", "<c-w>l", { noremap = true })

-- resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { noremap = true })
map("n", "<C-Down>", ":resize +2<CR>", { noremap = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true })

-- when wrapping is enabled do wrap friendly scrolling
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })
map("n", "Q", "gq", { noremap = true }) -- Q for formatting

-- move visual block up/down one
map("v", "<c-j>", '"td"tp\'[V\']', {})
map("v", "<c-k>", '"tdk"tP\'[V\']', {})

-- move a line up or down
map("n", "-", '"tdd"tp', { noremap = true })
map("n", "_", '"tddk"tP', { noremap = true })

map("i", "<C-U>", "<C-G>u<C-U>", { noremap = true })
-- map ('n', '<localleader><CR>', 'i<CR><ESC>k$', {silent=true})

-- select all
map("n", "<leader>sa", "gggH<C-O>G", { noremap = true, desc = "Select All" })

-- Indentation changes, but visual stays
map("v", ">", "><CR>gv", { noremap = true })
map("v", "<", "<<CR>gv", { noremap = true })

-- sourcing vimrc
map(
    "n",
    "<leader>fv",
    ":source $MYVIMRC<cr>",
    {
        noremap = true,
        desc = "Source init file"
    }
)
map(
    "n",
    "<leader>ev",
    ":rightbelow vsplit $MYVIMRC<cr>",
    {
        noremap = true,
        desc = "Edit init file"
    }
)

-- nvim cmds
map("n", "<leader>fq", ":qa<cr>", { noremap = true, desc = "Quit All" })
map("n", "<leader>fQ", ":qa<cr>", { noremap = true, desc = "Force Quit All" })
map("n", "<leader>fe", ":q<cr>", { noremap = true, desc = "Quit" })
map("n", "<leader>fE", ":q!<cr>", { noremap = true, desc = "Force Quit" })
map("n", "<leader>fw", ":w<cr>", { noremap = true, desc = "Write" })
map("n", "<leader>fW", ":w!<cr>", { noremap = true, desc = "Force Write" })
map("n", "<leader>bw", ":bw<cr>", { noremap = true, desc = "Buffer / Wipe" })
map("n", "<leader>bd", ":bd<cr>", { noremap = true, desc = "Buffer / Delete" })
map("n", "<leader>bn", ":bn<cr>", { noremap = true, desc = "Buffer / Next" })
map("n", "<leader>bp", ":bp<cr>", { noremap = true, desc = "Buffer / Previous" })
map("n", "<leader>fs", ":w!<cr>", { noremap = true, desc = "File / Save" })
map("n", "<leader>fn", ":enew<cr>", { noremap = true, desc = "File / New" })
map("n", "<leader>fp", ":echo expand('%:h')<cr>", { noremap = true, desc = "File / Path" })
map("n", "<leader>fc", ":e <cfile><cr>", { noremap = true, desc = "File / Create" })
map("n", "<leader>fh", ":lua vim.notify(vim.fn.expand('%:p'), 'info', {title='Fullpath', timeout=1000})<cr>",
    { noremap = true, silent = true, desc = "File / Fullpath" })
