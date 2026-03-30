return {
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
    opts = function()
      vim.g.mkdp_auto_close = 0
    end,
  },
}
