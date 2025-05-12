return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- keys = {
        --   { "<leader>o", "<cmd>Oil<CR>", desc = "File Explorer" },
        -- },
        opts = {
          default_file_explorer = true,
          view_options = {
            show_hidden = true,
          },
        },
      },
}