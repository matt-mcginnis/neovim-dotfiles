local neocodeium = require("neocodeium")
neocodeium.setup()

vim.keymap.set("i", "<c-e>", function()
    require("neocodeium").accept()
end)
vim.keymap.set("i", "<c-w>", function()
    require("neocodeium").accept_word()
end)
vim.keymap.set("i", "<c-l>", function()
    require("neocodeium").accept_line()
end)
vim.keymap.set("i", "<c-.>", function()
    require("neocodeium").cycle_or_complete()
end)
vim.keymap.set("i", "<c-,>", function()
    require("neocodeium").cycle_or_complete(-1)
end)
vim.keymap.set("i", "<c-c>", function()
    require("neocodeium").clear()
end)
