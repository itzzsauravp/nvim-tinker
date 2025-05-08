require("config.options")
require("config.keybinds")
require("config.lazy")

-- Auto Reload file on external changes ( but i use `:e` most of the time )
-- vim.o.autoread = true
-- vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
--   command = "checktime"
-- })
