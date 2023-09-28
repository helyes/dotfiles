-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["D"] = { "<CMD>Telescope projects<CR>", "Projects" }

-- https://www.lunarvim.org/docs/configuration/keybindings
-- to check whichkey mapping:
--    lua AHI(lvim.builtin.which_key.mappings['s'])

-- with vim (<TAB> works): verbose nmap <space>q

-- enabled register listing on "
lvim.builtin.which_key.setup.plugins.registers = true

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<CMD>Trouble lsp_references<CR>", "References" },
  f = { "<CMD>Trouble lsp_definitions<CR>", "Definitions" },
  d = { "<CMD>Trouble document_diagnostics<CR>", "Diagnostics" },
  q = { "<CMD>Trouble quickfix<CR>", "QuickFix" },
  l = { "<CMD>Trouble loclist<CR>", "LocationList" },
  w = { "<CMD>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
}

-- lua a = require("user.helpers").buffer_parent(); vim.cmd("Oil " .. a)
lvim.builtin.which_key.mappings["o"] = {
    "<CMD>lua a = require('user.helpers').buffer_parent(); vim.cmd('Oil ' .. a)<CR>", "Open OIL in current folder"
}
lvim.builtin.which_key.mappings["O"] = {
    "<CMD>Oil .<CR>", "Open OIL in project root"
}

lvim.builtin.which_key.mappings["a"] = {
  name = "A.I.",
  c = { "<CMD>ChatGPT<CR>", "ChatGPT" },
  a = { "<CMD>ChatGPTActAs<CR>", "Act As GPT" },
  e = { "<CMD>ChatGPTEditWithInstructions<CR>", "Edit GPT" },
  r = { "<CMD>ChatRunCustomCodeAction<CR>", "Code Action GPT" },
  s = { "<CMD>Copilot suggestion<CR>", "Toggle Copilot Suggestion" },
  p = { "<CMD>Copilot panel<CR>", "Toggle Copilot Panel" },
  t = { "<CMD>Copilot toggle<CR>", "Toggle Copilot" },
}

lvim.builtin.which_key.mappings["lL"] = {
  -- "<CMD>lua require('user.lsp_lines').toggle(); vim.diagnostic.config({virtual_text = true})<CR>", "Toggle lsp_lines"
  "<CMD>lua require('user.lsp_lines').toggle()<CR>", "Toggle lsp_lines"
}

 lvim.builtin.which_key.mappings["g"]["t"] = {
  name = "+Toggle",
  b = { "<CMD>Gitsigns toggle_current_line_blame<CR>", "Blame" },
  w = { "<CMD>Gitsigns toggle_word_diff<CR>", "Word diff" },
  l = { "<CMD>Gitsigns toggle_linehl<CR>", "Line highlight" },
  n = { "<CMD>Gitsigns toggle_numhl<CR>", "Num highlight" },
  d = { "<CMD>Gitsigns toggle_deleted<CR>", "Deleted" },
}

