local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Set a breakpoint
map('n', '<leader>db', '<Cmd>call vimspector#ToggleBreakpoint()<CR>', opts)

-- Set a conditional breakpoint
map('n', '<leader>dc', '<Cmd>call vimspector#AddConditionalBreakpoint()<CR>', opts)

-- Remove a breakpoint
-- VimSpector does not have a specific command to remove a breakpoint by a key command. 
-- You generally toggle them on/off with the same command or use the Vimspector UI to manage them.

-- Step over
map('n', '<leader>dn', '<Cmd>call vimspector#StepOver()<CR>', opts)

-- Step into
map('n', '<leader>di', '<Cmd>call vimspector#StepInto()<CR>', opts)

-- Step out of
map('n', '<leader>do', '<Cmd>call vimspector#StepOut()<CR>', opts)

-- Continue execution
map('n', '<leader>dc', '<Cmd>call vimspector#Continue()<CR>', opts)

