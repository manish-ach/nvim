-- ~/.config/nvim/lua/plugins/project.lua

return {
    "ahmedkhalf/project.nvim",
    init = function()
        -- Patch the project_nvim module to fix the deprecation warning
        -- This needs to happen before setup
        local ok, project_module = pcall(require, "project_nvim.project")
        if ok and project_module then
            -- Store original function for reference if needed
            project_module._original_get_lsp_root = project_module.get_lsp_root
            
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
        
        require("project_nvim").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
        
        -- Absolutely minimal implementation of fzf-lua based project finder
        -- for fzf-lua, due to request from @KrisWilliams1 (Maybe extended to a
        -- full blown port from the original selector in the future)
        local history = require("project_nvim.utils.history")
        local project = require("project_nvim.project")
        vim.api.nvim_create_user_command("FzfProjects", function()
            local projects = history.get_recent_projects()
            require("fzf-lua").fzf_exec(projects, {
                prompt = "Projects> ",
                actions = {
                    ["default"] = function(selected)
                        if selected and #selected > 0 then
                            local project_path = selected[1]
                            if project.set_pwd(project_path, "fzf-lua") then
                                require("fzf-lua").files()
                            end
                        end
                    end
                }
            })
        end, {})
    end,
    keys = {
        {
            "<leader>fp", "<cmd>FzfProjects<CR>", desc="Find Recent Projects"
        }
    }
}
