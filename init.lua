require("options")
require("tempKeyMaps")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Auto-format on save configuration
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.html,*.css,*.scss,*.json,*.md,*.vue FormatWrite
  augroup END
]]

-- Defining FormatWrite command for Neovim 0.5
vim.api.nvim_exec(
  [[
    command! -nargs=0 FormatWrite :lua vim.lsp.buf.formatting_sync(nil, 1000)
  ]],
  false
)

-- Or for Neovim 0.6 and later
vim.api.nvim_create_user_command('FormatWrite', function()
  vim.lsp.buf.format({ async = true })
end, {})

-- For init.lua
vim.g.python3_host_prog = 'C:\\Users\\benkosta\\AppData\\Local\\Programs\\Python\\Python39\\python.exe'

