return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = { event = "msg_show", kind = "search_count" },
          view = "mini",
        },
      },
    },
  },
}
