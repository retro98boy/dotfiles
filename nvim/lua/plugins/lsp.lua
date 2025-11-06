return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      ["*"] = {
        keys = {
          { "K", "10k" },
          { "gK", false },
          { "<C-k>", "<Up>", mode = { "i" } },
          { "<C-k>", "<C-w>k", mode = { "n" } },
          { "<F12>", vim.lsp.buf.hover, mode = { "n", "i" }, desc = "Hover" },
          {
            "<F11>",
            vim.lsp.buf.signature_help,
            mode = { "n", "i" },
            desc = "Signature Help",
            has = "signatureHelp",
          },
        },
      },
    },
  },
}
