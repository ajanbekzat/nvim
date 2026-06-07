return {
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
    opts = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_echo_preview_url = 1 -- also print the URL in the cmdline
      vim.g.mkdp_auto_start = 0

      -- On a remote (SSH) box there's no usable browser, so instead of opening
      -- one we copy the preview URL to *your local* clipboard via OSC 52
      -- (which tunnels back through the SSH session). Locally we leave the
      -- hook empty so nvim keeps auto-opening the browser as before.
      --
      -- The port is pinned ONLY on the remote, where the SSH forward needs a
      -- predictable number. Locally we keep the random default: pinning it
      -- there means a stale/orphaned preview server (left behind by :qa! or a
      -- crash) holds the port and the next preview dies with EADDRINUSE.
      if vim.env.SSH_CONNECTION or vim.env.SSH_TTY then
        vim.g.mkdp_port = "8765" -- fixed port so SSH forwarding is predictable
        function _G.__mkdp_copy_url(url)
          local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
          if ok then
            pcall(osc52.copy("+"), { url }) -- send to local terminal's clipboard
          end
          pcall(vim.fn.setreg, "+", url) -- also fill the + register
          vim.schedule(function()
            vim.notify("Markdown preview URL copied to clipboard:\n" .. url, vim.log.levels.INFO)
          end)
        end
        vim.cmd([[
          function! MkdpCopyUrl(url) abort
            call v:lua.__mkdp_copy_url(a:url)
          endfunction
        ]])
        vim.g.mkdp_browserfunc = "MkdpCopyUrl"
      end
    end,
  },
}
