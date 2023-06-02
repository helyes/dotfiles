local status_ok, crates = pcall(require, "crates")
if not status_ok then
  print("!!!Crates plugin not loaded")
  return
end

crates.setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      })


-- equivalent to the below
-- instead of calling setup here (above),
-- fidget.setup() could have been called in plugins.lua
-- this is here as an example, calling setup in config would have been better
--{
-- "j-hui/fidget.nvim",
-- event = "VeryLazy",
-- config = function()
--  require("fidget").setup()
-- end,
--},

