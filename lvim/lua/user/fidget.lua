local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  print("!!!Fidget plugin not loaded")
  return
end

fidget.setup()

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

