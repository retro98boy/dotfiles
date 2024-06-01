return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- all使能所有解释器
      ensure_installed = {
        "devicetree",
        "diff",
        "dockerfile",
        "html",
        "make",
        "vim",
      },
      ignore_install = {},
      -- 高亮模块
      highlight = {
        enable = true,
        disable = {},
      },
      -- 增量选择模块
      incremental_selection = {
        enable = true,
        disable = {},
        keymaps = {
          -- 设置成false关闭一个按键映射
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<Tab>", -- 可视模式使用
        },
      },
      -- 缩进模块(=)
      indent = {
        enable = true,
        disable = {},
      },
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
