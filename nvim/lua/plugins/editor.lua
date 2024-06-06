return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      if type(opts.window.mappings) == "table" then
        opts.window.mappings = vim.tbl_extend("force", opts.window.mappings, {
          ["o"] = "open",
        })
      end
      if type(opts.filesystem) == "table" then
        opts.filesystem = vim.tbl_extend("force", opts.filesystem, {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false, -- only works on Windows for hidden files/directories
          },
        })
      end
    end,
  },

  {
    "hedyhli/outline.nvim",
    opts = function(_, opts)
      opts.outline_window = {
        width = 20,
      }
      opts.keymaps = {
        show_help = "?",
        close = { "<Esc>", "q" },
        goto_location = "o",
        peek_location = "<Cr>",
        goto_and_close = "O",
        restore_location = "<C-g>",
        hover_symbol = "<C-space>",
        toggle_preview = "P",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_toggle = "<Tab>",
        fold_toggle_all = "<S-Tab>",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
        down_and_jump = "<C-j>",
        up_and_jump = "<C-k>",
      }
      return opts
    end,
  },

  { "tenxsoydev/karen-yank.nvim", config = true },
}
