require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettier,
        -- Add other formatters or linters here
    },
})
