# Neovim Configuration

Personal Neovim configuration built on [LazyVim](https://lazyvim.github.io/).

## Setup

1. Back up your existing Neovim config (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:

   ```bash
   git clone git@github.com:ajanbekzat/nvim.git ~/.config/nvim
   ```

3. Open Neovim — plugins will install automatically on first launch:

   ```bash
   nvim
   ```

## Structure

| Path | Purpose |
|---|---|
| `init.lua` | Entry point, loads `config.lazy` |
| `lua/config/lazy.lua` | Bootstraps lazy.nvim and defines the plugin spec |
| `lua/config/options.lua` | Custom vim options |
| `lua/config/keymaps.lua` | Custom keymaps |
| `lua/config/autocmds.lua` | Custom autocommands |
| `lua/plugins/*.lua` | Plugin specs (auto-loaded by lazy.nvim) |

## Enabled LazyVim Extras

- AI: Copilot
- Languages: Docker, JSON, Markdown, Python, TOML
- Utilities: Dot

## Plugins

- **Colorscheme:** [solarized-osaka](https://github.com/craftzdog/solarized-osaka.nvim) (with transparency)
- **AI:** [avante.nvim](https://github.com/yetone/avante.nvim) (Claude provider), [claudecode.nvim](https://github.com/coder/claudecode.nvim)

## Formatting

Lua files are formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) (2-space indent, 120 column width):

```bash
stylua lua/
```

## License

[Apache 2.0](LICENSE)
