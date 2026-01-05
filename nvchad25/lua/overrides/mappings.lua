-- remapping nvimchad core maps
-- local keymaps_n = vim.api.nvim_get_keymap("n")
local keymaps = {
    n = vim.api.nvim_get_keymap "n",
}
local mleader = vim.g.mapleader

function get_keymap_description(mode, shortcut_human)
    local shortcut = string.gsub(shortcut_human, "<leader>", mleader)
    for _, keymap in ipairs(keymaps[mode]) do
        -- print(i, " key:", keymap)
        if keymap.lhs == shortcut then
            return keymap.desc or "No description available"
        end
    end
    return "Keymap not found"
end

local function get_keymap(mode, shortcut_human)
    local shortcut = string.gsub(shortcut_human, "<leader>", mleader)
    for _, keymap in ipairs(keymaps[mode]) do
        -- print(i, " key:", vim.inspect(keymap))
        if keymap.lhs == shortcut then
            return keymap
        end
    end
end


-- Find nvchad mappings here
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
local function override_nvchad_keymap(mode, nvchad_keymap, custom_keymap)
    local vim_keymap = get_keymap(mode, custom_keymap);
    if vim_keymap then
        print("Not overriding", custom_keymap, ", already exists:", vim_keymap.desc)
        return
    end

    local vim_nvchad_keymap = get_keymap(mode, nvchad_keymap);
    if vim_nvchad_keymap then
        print("Overriding", nvchad_keymap, "to", custom_keymap, "  ---> ", vim_nvchad_keymap.desc)
        -- print("Not overriding", custom_keymap, ", already exists:", vim_keymap.desc)
        -- vim_nvchad_keymap.lhs = string.gsub(custom_keymap, "<leader>", mleader)
        -- vim_nvchad_keymap.lhs = " fff"
        -- map("n", ";", ":", { desc = "CMD enter command mode" })
        -- vim.keymap.set(mode, custom_keymap, nvchad_keymap.callback, { desc = nvchad_keymap.desc })

        return
    end
    -- local nvchad_keymap_description =

    -- local description = get_keymap_description(mode, nvchad_keymap)
    -- local is_new_map_taken = vim.api.nvim_get_keymap(mode)
end

-- Example use
-- telescope find marks
-- print(override_nvchad_keymap("n", "<leader>fm", "<leader>lf"))
-- print(override_nvchad_keymap("n", "<leader>ma", "<leader>fm"))
-- print(get_keymap_description('n', ' fa'))

print("mapleader: '", vim.g.mapleader, "'")
local function remap() end
