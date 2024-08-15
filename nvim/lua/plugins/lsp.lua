return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "K", "10k" }
      keys[#keys + 1] = { "gK", false }
      keys[#keys + 1] = { "<C-k>", false }
      keys[#keys + 1] = { "<C-k>", "<Up>", mode = { "i" } }
      keys[#keys + 1] = { "<C-k>", "<C-w>k", mode = { "n" } }
      keys[#keys + 1] = { "<F12>", vim.lsp.buf.hover, mode = { "n", "i" }, desc = "Hover" }
      keys[#keys + 1] = {
        "<F11>",
        vim.lsp.buf.signature_help,
        mode = { "n", "i" },
        desc = "Signature Help",
        has = "signatureHelp",
      }
    end,
  },
}
