---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fk"] = { ":Telescope keymaps<CR>", "Find keymaps", }
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
