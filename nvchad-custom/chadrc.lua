---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

-- Meant to override default_config.lua
-- https://nvchad.com/docs/config/walkthrough#custom_config

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "ayu_dark", "catppuccin" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
