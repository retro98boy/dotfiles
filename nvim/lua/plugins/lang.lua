return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- 禁止自动安装
      for server, server_opts in pairs(opts.servers) do
        server_opts.mason = false
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- 禁止自动安装
      opts.ensure_installed = {}
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    enabled = false,
  },

  {
    "Civitasv/cmake-tools.nvim",
    enabled = false,
  },

  {
    "mfussenegger/nvim-dap",
    -- stylua: ignore
    keys = {
      { "<F5>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<F6>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<F7>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<F8>", function() require("dap").continue() end, desc = "Continue" },
      { "<F9>", function() require("dap").pause() end, desc = "Pause" },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["cppdbg"] then
        dap.adapters["cppdbg"] = {
          id = "cppdbg",
          type = "executable",
          -- linux
          command = "/home/zhenlin/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
          -- windows
          -- command = "C:\\Users\\zhenlin\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
          -- options = {
          --   detached = false,
          -- },
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
}
