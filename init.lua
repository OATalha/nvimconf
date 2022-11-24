vim.g.python3_host_prog = '/Volumes/profiles/tahmed/.virtualenvs/devenv39/bin/python'
vim.g.loaded_perl_provider = 0

-- for nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.suffixesadd:append('.lua')
vim.opt.path:append('lua/')

vim.cmd [[color habamax]]

if os.getenv('PYTHONPATH') then
    vim.cmd [[let $PYTHONPATH=$PYTHONPATH . ':/Volumes/profiles/tahmed/Repos/sapper_excludes/completion/maya/2018/py']]
else
    vim.cmd [[let $PYTHONPATH='/Volumes/profiles/tahmed/Repos/sapper_excludes/completion/maya/2018/py']]
end

package.loaded['nvim_init'] = nil
require 'nvim_init'


