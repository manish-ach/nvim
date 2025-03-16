
local diagnostics_active = true
function ToggleDiagnostics()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
end

vim.api.nvim_set_keymap('n', '<leader>td', ':lua ToggleDiagnostics()<CR>', { noremap = true, silent = true })

