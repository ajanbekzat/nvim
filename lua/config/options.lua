-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use OSC 52 for clipboard over SSH (copies yanked text to local machine clipboard)
if os.getenv("SSH_TTY") then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
  vim.opt.clipboard = "unnamedplus"
end

-- Detect macOS system appearance and set background accordingly
local function get_system_appearance()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result:find("Dark") then
      return "dark"
    end
  end
  return "light"
end

local function sync_theme()
  local bg = get_system_appearance()
  if vim.o.background ~= bg then
    vim.o.background = bg
    -- Re-apply transparent only in dark mode
    require("solarized-osaka").setup({ transparent = bg == "dark" })
    vim.cmd.colorscheme("solarized-osaka")
  end
end

vim.o.background = get_system_appearance()

-- Auto-sync theme when Neovim regains focus (e.g. after switching system appearance)
vim.api.nvim_create_autocmd("FocusGained", {
  callback = sync_theme,
})

-- Manual command to sync theme
vim.api.nvim_create_user_command("SyncTheme", sync_theme, {})
