# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on [LazyVim](https://lazyvim.github.io/) — a Neovim setup powered by lazy.nvim. All configuration is in Lua.

## Architecture

- `init.lua` — Entry point, loads `config.lazy`
- `lua/config/lazy.lua` — Bootstraps lazy.nvim and sets up the plugin spec (imports LazyVim core + `lua/plugins/`)
- `lua/config/options.lua` — Custom vim options (loaded before lazy.nvim startup)
- `lua/config/keymaps.lua` — Custom keymaps (loaded on VeryLazy event)
- `lua/config/autocmds.lua` — Custom autocommands (loaded on VeryLazy event)
- `lua/plugins/*.lua` — Each file returns a table of plugin specs; all are auto-loaded by lazy.nvim

The active colorscheme is `solarized-osaka` (with transparency enabled), set in `lua/config/lazy.lua`.

## Enabled LazyVim Extras

Defined in `lazyvim.json`: copilot, docker, json, markdown, python, toml, dot.

## Formatting

Lua files are formatted with StyLua. Config in `stylua.toml`:
- Indent: 2 spaces
- Column width: 120

Run: `stylua lua/`

## Adding Plugins

Create a new file in `lua/plugins/` returning a lazy.nvim plugin spec table. To override a LazyVim default plugin, use the same plugin name and merge opts. See `lua/plugins/example.lua` for patterns (it's guarded by `if true then return {} end` so nothing in it loads).

## Remote Setup (Ubuntu/Linux)

To clone and run this config on a remote machine:

1. Install Neovim 0.10+ (avoid snap — use the AppImage):
   ```bash
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
   chmod u+x nvim-linux-x86_64.appimage
   sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
   ```

2. Install build dependencies for tree-sitter parsers:
   ```bash
   sudo apt install -y build-essential g++ npm
   sudo npm install -g tree-sitter-cli
   ```
   If `tree-sitter-cli` from npm fails with a GLIBC version error, install an older version (`sudo npm install -g tree-sitter-cli@0.24.7`) or build from source via `cargo install tree-sitter-cli`.

3. Clone the config and launch:
   ```bash
   git clone <repo-url> ~/.config/nvim
   rm ~/.config/nvim/lazy-lock.json   # let lazy.nvim resolve fresh versions
   nvim
   ```
   Lazy.nvim will auto-install all plugins on first launch.
