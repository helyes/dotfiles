-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["D"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- lua a = require("user.helpers").buffer_parent(); vim.cmd("Oil " .. a)
lvim.builtin.which_key.mappings["o"] = {
    "<cmd>lua a = require('user.helpers').buffer_parent(); vim.cmd('Oil ' .. a)<cr>", "Open OIL in current folder"
}
lvim.builtin.which_key.mappings["O"] = {
    "<cmd>Oil .<cr>", "Open OIL in project root"
}
-- enabled register listing on "
lvim.builtin.which_key.setup.plugins.registers = true

