---@type MappingsTable
local core_mappings = require("core.mappings")

---@param core_group string
---@param mode string
---@param core_key string
---@param disable_core_mapping boolean
---@param custom_mappings MappingsTable
---@param custom_group string
---@param custom_key string
local function remap_core_mapping(core_group, mode, core_key, disable_core_mapping, custom_mappings, custom_group, custom_key)
  -- print(custom_mappings[custom_group])

  -- must be a better way. Checking if key exists in table
  if custom_mappings[custom_group] == nil then
    custom_mappings[custom_group] = {}
  end

  if custom_mappings[custom_group][mode] == nil then
    custom_mappings[custom_group][mode] = {}
  end

  custom_mappings[custom_group][mode][custom_key] = core_mappings[core_group][mode][core_key];

  if disable_core_mapping then
    custom_mappings.disabled[mode][core_key] = ""
  end
end


---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- easier to reach than C-s
    -- ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
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
    -- Core remaps
    -- Core: ["<leader>wa"]
    ["<leader>lwa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    -- Core: ["<leader>wl"]
    ["<leader>lwl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    -- Core: ["<leader>wr"]
    ["<leader>lwr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

  },

}

M.chad = {
  n = {
    ["<leader>fk"] = { ":Telescope keymaps<CR>", "Find keymaps", },
    ["<leader>Nln"] = { ":edit $NVIM_LOG_FILE<CR>", "Neovim log", }, -- $NVIM_LOG_FILE
    ["<leader>Nll"] = { ":lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<CR>", "LSP logfile", },
  }
}

M.whichkey = {
  n = {
    ["<leader>NK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>Nk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

-- this is not ideal
M.gitsigns = {
  n = {
    ["<leader>gg"] = {
  function()
    local term = require("nvterm.terminal").new("float")
    vim.api.nvim_chan_send(term.job_id, "lazygit\n")
  end,
  "Open Lazygit",
},
  }
}
-- more keybinds!
-- Disabled
M.disabled = {
  n = {
    -- M.general
    -- ["<C-s>"] = "",
    -- M.lspconfig
    ["<leader>wa"] = "",
    ["<leader>wl"] = "",
    ["<leader>wk"] = "",
    -- M.whichkey
    ["<leader>wK"] = "",
    ["<leader>wr"] = "",
  },
}



-- simple remaps from nvchad code

-- buffer
remap_core_mapping("general", "n", "<leader>b", true, M, "tabufline", "<leader>be")
-- remap_core_mapping("tabufline", "n", "<leader>x", true, M, "tabufline", "<leader>bx")

-- save file
remap_core_mapping("general", "n", "<C-s>", true, M, "general", "<leader>w")

-- themes
remap_core_mapping("telescope", "n", "<leader>th", true, M, "chad", "<leader>Nt")
-- mapping cheat sheet
remap_core_mapping("general", "n", "<leader>ch", true, M, "chad", "<leader>Nm")

-- toggle line numbers and relative line numbers
remap_core_mapping("general", "n", "<leader>n", true, M, "chad", "<leader>Nn")
remap_core_mapping("general", "n", "<leader>rn", true, M, "chad", "<leader>NN")

-- git
-- toggle deleted
remap_core_mapping("gitsigns", "n", "<leader>td", true, M, "gitsigns", "<leader>gd")
-- reset hunk
remap_core_mapping("gitsigns", "n", "<leader>rh", true, M, "gitsigns", "<leader>gr")
-- preview hunk
remap_core_mapping("gitsigns", "n", "<leader>ph", true, M, "gitsigns", "<leader>gp")
-- status [telescope]
remap_core_mapping("telescope", "n", "<leader>gt", true, M, "gitsigns", "<leader>gs")
-- commits [telescope]
remap_core_mapping("telescope", "n", "<leader>cm", true, M, "gitsigns", "<leader>gc")

-- lsp
-- lsp rename
remap_core_mapping("lspconfig", "n", "<leader>ra", true, M, "lspconfig", "<leader>lr")
-- lsp format
remap_core_mapping("general", "n", "<leader>fm", true, M, "lspconfig", "<leader>lm")
remap_core_mapping("lspconfig", "n", "<leader>ca", true, M, "lspconfig", "<leader>la")
remap_core_mapping("blankline", "n", "<leader>cc", true, M, "lspconfig", "<leader>lc")


return M
