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

-- Detect macOS system appearance, default to dark on non-macOS (e.g. remote Ubuntu)
local is_mac = vim.fn.has("mac") == 1

local function get_system_appearance()
  if not is_mac then
    return "dark"
  end
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

local function apply_theme(bg)
  vim.o.background = bg
  require("solarized-osaka").setup({ transparent = bg == "dark" })
  vim.cmd.colorscheme("solarized-osaka")
end

local function sync_theme()
  local bg = get_system_appearance()
  if vim.o.background ~= bg then
    apply_theme(bg)
  end
end

local function toggle_theme()
  local bg = vim.o.background == "dark" and "light" or "dark"
  apply_theme(bg)
end

vim.o.background = get_system_appearance()

-- Auto-sync theme on focus (macOS only)
if is_mac then
  vim.api.nvim_create_autocmd("FocusGained", {
    callback = sync_theme,
  })
end

-- Manual commands
vim.api.nvim_create_user_command("SyncTheme", sync_theme, {})
vim.api.nvim_create_user_command("ToggleTheme", toggle_theme, {})
