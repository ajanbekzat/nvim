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
