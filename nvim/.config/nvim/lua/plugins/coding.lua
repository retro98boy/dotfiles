return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- 禁止自动补全时自动选择第一候选项
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }

      if type(opts.mapping) == "table" then
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-c>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- 超级Tab按键：https://www.lazyvim.org/configuration/examples
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      end
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = false,
    event = "VeryLazy",
    opts = {
      size = 20,
      open_mapping = [[<C-\>]],
      hide_numbers = false,
      autochdir = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 3,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 3,
      },
    },
  },

  {
    "echasnovski/mini.comment",
    enabled = false,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      -- 注释符号和注释之间加空格
      padding = true,
      -- 光标停留在原位
      sticky = true,
      -- 注释/取消注释时忽略的行
      ignore = nil,
      -- NORMAL模式下按键映射
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      -- O-PENDING模式下按键映射
      opleader = {
        line = "gc",
        block = "gb",
      },
      -- 额外按键映射
      extra = {
        above = "gcO", -- 当前行上面添加注释
        below = "gco", -- 当前行下面添加注释
        eol = "gcA", -- 行尾添加注释
      },
      -- 按键绑定开关
      mappings = {
        basic = true, -- 如果为false，gcc gbc gc[count]{motion} gb[count]{motion}等按键不会工作
        extra = true, -- 如果为false，gco, gcO, gcA等按键不会工作
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
}
