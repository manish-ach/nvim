-- ~/.config/nvim/lua/plugins/project-patch.lua

-- This file patches project.nvim to fix the deprecation warning
-- Add this file to your config directory

return {
    "ahmedkhalf/project.nvim",
    -- Keep your existing config, just add this init function before your existing one
    init = function()
        -- Patch the project_nvim module to fix the deprecation warning
        local ok, project_module = pcall(require, "project_nvim.project")
        if ok and project_module then
            -- Replace with updated function using vim.lsp.get_clients() instead of vim.lsp.buf_get_clients()
            project_module.get_lsp_root = function()
                local bufnr = vim.api.nvim_get_current_buf()
                local clients = vim.lsp.get_clients({ bufnr = bufnr })
                
                if not clients or #clients == 0 then
                    return nil
                end
                
                for _, client in pairs(clients) do
                    local workspace = client.config.workspace_folders
                    local paths = {}
                    
                    if workspace then
                        for _, ws in pairs(workspace) do
                            table.insert(paths, vim.uri_to_fname(ws.uri))
                        end
                    elseif client.config.root_dir then
                        table.insert(paths, client.config.root_dir)
                    end
                    
                    for _, p in pairs(paths) do
                        if vim.fn.expand(p) ~= "" then
                            return p
                        end
                    end
                end
                
                return nil
            end
        end
        
        -- Your existing setup will continue from here
    end,
    -- The rest of your config remains unchanged
}
