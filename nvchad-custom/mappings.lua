---@type MappingsTable

local M = {}



M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.telescope = {
  n = {
    ["<leader>fk"] = { ":Telescope keymaps<CR>", "Find keymaps", }
  }
}

M.lspconfig = {
  n = {
    -- also mapped to <leader>lf in core
    ["[f"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["]f"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  }
}
-- more keybinds!
-- Disabled
M.disabled = {
   n = {
      ["<leader>/"] = ""
  }
}

return M
