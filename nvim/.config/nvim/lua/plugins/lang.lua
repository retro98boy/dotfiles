return {
  {
    "neovim/nvim-lspconfig",
    -- 禁止自动安装
    opts = {
      servers = {
        clangd = {
          mason = false,
        },
        neocmake = {
          mason = false,
        },
        jsonls = {
          mason = false,
        },
        lua_ls = {
          mason = false,
        },
        marksman = {
          mason = false,
        },
        pyright = {
          mason = false,
        },
        ruff_lsp = {
          mason = false,
        },
        rust_analyzer = {
          mason = false,
        },
        taplo = {
          mason = false,
        },
        yamlls = {
          mason = false,
        },
        bufls = {
          mason = false,
          cmd = { "bufls", "serve" },
          filetypes = { "proto" },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      -- 禁止自动安装
      ensure_installed = {},
    },
  },

  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      if not dap.adapters["cppdbg"] then
        dap.adapters["cppdbg"] = {
          id = "cppdbg",
          type = "executable",
          -- command = "/absolute/path/to/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
        }
      end
      for _, lang in ipairs({ "c", "cpp" }) do
        if type(dap.configurations[lang]) == "table" then
          vim.list_extend(dap.configurations[lang], {
            {
              name = "Launch file via cppdbg",
              type = "cppdbg",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopAtEntry = true,
            },
            {
              name = "Attach to process via cppdbg",
              type = "cppdbg",
              request = "attach",
              processId = require("dap.utils").pick_process,
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopAtEntry = true,
            },
            {
              name = "Attach to gdbserver via cppdbg",
              type = "cppdbg",
              request = "launch",
              MIMode = "gdb",
              miDebuggerServerAddress = function()
                return vim.fn.input("ip:port: ")
              end,
              miDebuggerPath = function()
                return vim.fn.input("Path to gdb: ", "", "file")
              end,
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopAtEntry = true,
            },
          })
        end
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "proto" })
      end
    end,
  },
}
