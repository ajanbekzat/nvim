return {
  "coder/claudecode.nvim",
  config = true,
  keys = {
    { "<leader>a", nil, desc = "+ai" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>aS", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  },
}
