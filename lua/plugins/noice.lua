return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- Configure Noice to work better with vim-tpipeline
    cmdline = {
      view = "cmdline", -- Use traditional command line view instead of floating windows
    },
    messages = {
      view_search = false, -- Disable floating search UI replacement
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        ["vim.lsp.util.stylize_markdown"] = false,
      },
    },
    -- Prevent UI elements that might conflict with statusline
    views = {
      mini = {
        win_options = {
          winblend = 0, -- Make mini notifications solid
        },
      },
    },
    -- Reduce the number of Noice notifications/popups
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
