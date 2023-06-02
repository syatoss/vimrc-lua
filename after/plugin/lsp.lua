local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['Tab'] = cmp.mapping.select_next_item(cmp_select),
    ['S-Tab'] = cmp.mapping.select_prev_item(cmp_select),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
    }
)

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>n', function() vim.lsp.buf.goto_next() end, opts)
    vim.keymap.set('n', '<leader>N', function() vim.lsp.buf.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end)



lsp.setup()
