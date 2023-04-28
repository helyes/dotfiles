local M = {
  buffer_parent = function ()
  -- local buffer_parent = string.match(vim.api.nvim_buf_get_name(0), '(.+)%/') .. "/"
  return string.match(vim.api.nvim_buf_get_name(0), '(.+)%/') .. "/"
  end
}

return M
