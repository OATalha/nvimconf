vim.cmd [[
command! CleanupFloatingWindows :lua for _, win in ipairs(vim.api.nvim_list_wins()) do local config = vim.api.nvim_win_get_config(win); if config.relative ~= "" then vim.api.nvim_win_close(win, false); print('Closing window', win) end end
]]


-- DCC_JEDI = {
-- }
--
-- local pathsep = ':'
-- local maya_stubs = '/Volumes/profiles/tahmed/Repos/sapper_excludes/completion/maya/2018/py'
--
-- function DCC_JEDI.enable_maya()
--     local pythonpath = os.getenv('PYTHONPATH')
--     local newpythonpath = ""
--     if pythonpath == nil then
--         pythonpath = ""
--     end
--     if pythonpath then
--         newpythonpath = newpythonpath .. maya_stubs
--     else
--         newpythonpath = pythonpath .. pathsep
--     end
--
--     print("let $PYTHONPATH='" .. newpythonpath .. "'")
--
--     vim.cmd("let $PYTHONPATH='" .. newpythonpath .. "'")
--     status, _ = pcall(vim.cmd, [[LspRestart]])
--
--     -- vim.cmd("let $PYTHONPATH='" .. pythonpath .. "'")
-- end
