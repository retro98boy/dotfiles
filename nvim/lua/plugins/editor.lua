return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ee", "<cmd>Neotree focus<cr>", desc = "Neotree focus" },
    },
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
        },
      },
    },
  },

  {
    "hedyhli/outline.nvim",
    opts = {
      outline_window = {
        width = 20,
      },
      keymaps = {
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
      },
    },
  },

  { "tenxsoydev/karen-yank.nvim", config = true },
}
