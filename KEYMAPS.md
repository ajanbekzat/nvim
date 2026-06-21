# Neovim Keymaps Cheat Sheet

A reference for the most useful keymaps in this LazyVim setup.

- **Leader key is `<Space>`.** So `<leader>gd` means **Space → g → d**.
- **★ = custom to this config** (defined in `lua/plugins/` or `lua/config/`). Everything else is a LazyVim default.
- **Best discovery trick:** press `<Space>` and wait — **which-key** pops up showing every next key. Same after `g`, `]`, `[`, `z`. You rarely need to memorize; just explore.
- Find any keymap by name: `<leader>sk` (search keymaps).

---

## ★ Your custom keymaps (the stuff you added)

### Git diff viewer (diffview.nvim)
| Key | Action |
|-----|--------|
| `<leader>gd` | Open diff of all working-tree changes (side-by-side) |
| `<leader>gD` | Close the diff view |
| `<leader>gv` | Commit history of the **current file** |
| `<leader>gV` | Commit history of the **whole repo** |
| `<leader>gv` (visual) | History for the selected line range |

> Inside the diff view: `]c`/`[c` jump between changes, `<Tab>`/`<S-Tab>` cycle files, `q` to close. Needs a saved, git-tracked file.

### Claude Code (AI)
| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude Code panel |
| `<leader>af` | Focus the Claude window |
| `<leader>ar` | Resume previous Claude session |
| `<leader>aC` | Continue last conversation |
| `<leader>am` | Select Claude model |
| `<leader>ab` | Add current buffer to Claude's context |
| `<leader>as` (visual) | Send selection to Claude |
| `<leader>as` (in file tree) | Add the highlighted file |
| `<leader>aa` | Accept Claude's proposed diff |
| `<leader>ad` | Deny Claude's proposed diff |

### Markdown & terminal
| Key | Action |
|-----|--------|
| `<leader>mp` | Toggle Markdown preview in browser (copies URL to clipboard over SSH) |
| `<C-h/j/k/l>` (in terminal) | Jump out of a terminal buffer to the window left/down/up/right |

---

## Files & finding things

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (project root) |
| `<leader>fF` | Find files (current working dir) |
| `<leader>fg` | Find git-tracked files |
| `<leader>fr` | Recent files |
| `<leader>fb` | Open buffers |
| `<leader>fc` | Find a config file (this nvim config) |
| `<leader>fp` | Projects |
| `<leader>fn` | New empty file |
| `<leader>e` | Toggle file explorer (root) |
| `<leader>E` | Toggle file explorer (cwd) |
| `<leader>,` | Switch buffer (quick picker) |

## Search (grep & pickers)

| Key | Action |
|-----|--------|
| `<leader>/` or `<leader>sg` | Live grep across the project |
| `<leader>sG` | Grep in current working dir |
| `<leader>sb` | Fuzzy-search lines in current buffer |
| `<leader>sB` | Grep across all open buffers |
| `<leader>sw` | Search the word under the cursor |
| `<leader>sR` | Resume last picker |
| `<leader>sk` | Search keymaps |
| `<leader>sh` | Search help pages |
| `<leader>sc` | Command history |
| `<leader>sC` | Commands |
| `<leader>sd` | Search diagnostics (project) |
| `<leader>ss` | LSP symbols in file |
| `<leader>sm` | Marks |
| `<leader>sj` | Jumplist |

> In any picker: type to filter, `<C-j>/<C-k>` or arrows to move, `<Enter>` to open, `<C-v>`/`<C-s>` to open in vertical/horizontal split, `<Esc>` to close.

## Buffers, windows, tabs

| Key | Action |
|-----|--------|
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<leader>bb` or `` <leader>` `` | Switch to last buffer |
| `<leader>bd` | Close buffer (keeps window layout) |
| `<leader>bo` | Close all **other** buffers |
| `<leader>-` | Split window below |
| <code>&lt;leader&gt;&#124;</code> | Split window right |
| `<C-h/j/k/l>` | Move between windows |
| `<C-Up/Down/Left/Right>` | Resize current window |
| `<leader>wd` | Close window |
| `<leader>wm` | Zoom / maximize window (toggle) |
| `<leader><Tab><Tab>` | New tab |
| `<leader><Tab>]` / `[` | Next / previous tab |
| `<leader><Tab>d` | Close tab |

## Code & LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `gD` | Go to declaration *(note: many servers don't support this)* |
| `K` | Hover docs |
| `gK` | Signature help |
| `<leader>ca` | Code action (quick fixes, refactors) |
| `<leader>cr` | Rename symbol (everywhere) |
| `<leader>cR` | Rename the file (updates imports) |
| `<leader>cf` | Format file/selection |
| `<leader>cd` | Show line diagnostics |
| `<leader>cc` | Run codelens |
| `<leader>cs` | Document symbols (Trouble) |

## Diagnostics, quickfix, problems

| Key | Action |
|-----|--------|
| `]d` / `[d` | Next / previous diagnostic |
| `]e` / `[e` | Next / previous **error** |
| `]w` / `[w` | Next / previous **warning** |
| `<leader>xx` | Diagnostics list (Trouble) |
| `<leader>xX` | Buffer diagnostics (Trouble) |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `<leader>xt` | TODO/FIXME list (Trouble) |
| `<leader>st` | Search TODOs |

## Git

| Key | Action |
|-----|--------|
| `<leader>gg` | **Lazygit** (full TUI — the main git interface) |
| `<leader>gb` | Blame current line |
| `<leader>gB` | Open current line on GitHub/remote in browser |
| `<leader>gY` | Copy the GitHub/remote URL for current line |
| `<leader>gf` | Current file's git history (picker) |
| `<leader>gl` | Git log (picker) |
| **Hunks** (gitsigns) | |
| `]h` / `[h` | Next / previous changed hunk |
| `<leader>ghs` | Stage hunk (also works on a visual selection) |
| `<leader>ghr` | Reset hunk (discard changes) |
| `<leader>ghS` | Stage whole buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghp` | Preview hunk inline |
| `<leader>ghb` | Blame line (full) |
| `<leader>ghd` | Diff current file (native split) |
| `ih` (in visual/operator) | Select the hunk as a text object |

> See also your ★ diffview keymaps (`<leader>gd`, `<leader>gv`) above for a nicer side-by-side browser.

## Motions & editing tricks

| Key | Action |
|-----|--------|
| `s` | **Flash jump** — type 2 chars, then a label to teleport anywhere on screen |
| `S` | Flash Treesitter — jump to/select syntax nodes |
| `gcc` | Toggle comment on the line |
| `gc` (motion/visual) | Toggle comment over a motion or selection |
| `gco` / `gcO` | Add a comment line below / above |
| `gsa` (visual or motion) | **Surround add** — wrap with quotes/brackets (`gsaiw"` → wrap word in quotes) |
| `gsd` | Surround delete (`gsd"` removes surrounding quotes) |
| `gsr` | Surround replace (`gsr"'` swaps `"` for `'`) |
| `<A-j>` / `<A-k>` | Move line/selection down / up |
| `<` / `>` (visual) | Indent and keep selection |
| `<C-s>` | Save file (works in insert & normal) |

## UI toggles (`<leader>u…`)

| Key | Action |
|-----|--------|
| `<leader>uw` | Toggle line wrap |
| `<leader>ul` | Toggle line numbers |
| `<leader>uL` | Toggle relative numbers |
| `<leader>us` | Toggle spell check |
| `<leader>ud` | Toggle diagnostics |
| `<leader>uh` | Toggle LSP inlay hints |
| `<leader>uz` | Zen mode |
| `<leader>uZ` | Zoom mode |
| `<leader>ur` | Clear search highlight / redraw |

## Sessions, terminal, misc

| Key | Action |
|-----|--------|
| `<leader>qq` | Quit all |
| `<leader>qs` | Restore session for this dir |
| `<leader>ql` | Restore last session |
| `<C-/>` | Toggle floating terminal |
| `<leader>.` | Toggle scratch buffer |
| `<leader>l` | Open Lazy (plugin manager) |
| `<leader>cm` | Mason (LSP/tool installer) |

---

### Tips for finding more

1. **Press `<Space>` and pause** — which-key shows everything. Drill into any group (`g`, `s`, `f`, `c`, `x`, `u`, `a`…).
2. `<leader>sk` searches all keymaps by description.
3. The full LazyVim default list: <https://www.lazyvim.org/keymaps>
4. Your own keymaps live in `lua/config/keymaps.lua` and the `keys = {…}` blocks of each file in `lua/plugins/`.
