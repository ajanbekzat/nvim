return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff View (working tree)" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diff View Close" },
    { "<leader>gv", "<cmd>DiffviewFileHistory %<cr>", desc = "File History (current file)" },
    { "<leader>gV", "<cmd>DiffviewFileHistory .<cr>", desc = "File History (whole repo)" },
    -- visual mode: history for the selected line range
    { "<leader>gv", "<cmd>'<,'>DiffviewFileHistory<cr>", mode = "v", desc = "File History (selection)" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { layout = "diff2_horizontal" }, -- side-by-side, vertical split
    },
  },
}
