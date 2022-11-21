vim.g.python3_host_prog = '/Volumes/profiles/tahmed/Software/Python-3.9.14/bin/python3.9'
vim.g.loaded_perl_provider = 0

vim.opt.suffixesadd:append('.lua')
vim.opt.path:append('lua/')

vim.cmd [[color habamax]]

package.loaded['nvim_init'] = nil
require 'nvim_init'
