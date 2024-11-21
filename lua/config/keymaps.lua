vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Go down half page and center cursor"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Go up half page and center cursor"})

vim.keymap.set("v", ">", ">gv", {desc = "Indent right selected text and keep selection in visual mode"})
vim.keymap.set("v", "<", "<gv", {desc = "Indent left selected text and keep selection in visual mode"})
