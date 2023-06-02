local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n","<leader>wa",mark.add_file)
vim.keymap.set("n","<leader>ww",ui.toggle_quick_menu)
vim.keymap.set("n","<leader>wl",ui.nav_next)
vim.keymap.set("n","<leader>wh",ui.nav_prev)
