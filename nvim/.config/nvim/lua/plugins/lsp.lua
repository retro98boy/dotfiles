return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", mode = "n", false }
      keys[#keys + 1] = { "<C-k>", mode = "i", false }
      keys[#keys + 1] = { "gk", vim.lsp.buf.hover, desc = "Hover" }
      keys[#keys + 1] = { "gs", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
    end,
  },
}
