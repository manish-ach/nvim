vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {desc="open parent dir in float [Oil]"})
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end,
    {desc="Open Diagnostics in Float"}
)
