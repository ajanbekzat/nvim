return {
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
    opts = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_port = "8765" -- fixed port so SSH forwarding is predictable
      vim.g.mkdp_echo_preview_url = 1 -- print the URL instead of auto-opening a browser
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_browser = "" -- don't try to launch a browser on the remote
    end,
  },
}
