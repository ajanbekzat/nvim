# Fish shell cheatsheet

Quick reference for the custom [fish](https://fishshell.com/) setup. The actual config lives in
`~/.config/fish/` — aliases in `config.fish`, functions in `functions/`, completions in
`completions/`. That directory isn't version-controlled, so this file is just a usage reference.

## SSH port forwarding

Make a port running on a remote machine reachable on this Mac at `localhost:<port>`
(SSH local forwarding, `ssh -L`, wrapped in a few helpers).

| Command | What it does |
| --- | --- |
| `fwd <host> <remote-port> [local-port]` | Open a background tunnel. Local port defaults to the remote port. |
| `fwd <remote-port>` | Same, using the default host (`$FWD_HOST`, default `h26`). |
| `fwds` | **List the ports you're currently receiving from remotes.** |
| `unfwd <local-port>` | Close the tunnel on that local port. |
| `unfwd all` | Close all tunnels you opened (leaves live ssh sessions alone). |
| `rports [host]` | List ports currently LISTENing on the remote (discover what to forward). |

Examples:

```fish
fwd h26 8000           # remote :8000  ->  http://localhost:8000
fwd h26 8000 9000      # remote :8000  ->  http://localhost:9000  (avoid a local clash)
fwd 5432               # default host :5432 -> localhost:5432
fwds                   # see everything you're receiving
unfwd 8000             # tear down one tunnel
rports h26             # what's listening over there?
```

Change the default host for the short form:

```fish
set -Ux FWD_HOST h19
```

Tab-completion: `fwd`/`rports` complete host names from `~/.ssh/config`; `unfwd` completes your
live forwarded ports (plus `all`).

## SSH to the remote hosts

Hosts `h19`, `h26`, `h201` are defined in `~/.ssh/config` (key, user, keep-alives), so:

```fish
ssh h26                                 # connect by short name
scp h26:/path/to/file .                 # copy with the short name too
getfile   <remote-path> [local-dest]    # scp a file down  (default host)
getfolder <remote-path> [local-dest]    # scp a folder down (recursive)
```

## Everyday aliases

| Alias | Expands to |
| --- | --- |
| `vi` | `nvim` |
| `t` | attach to tmux, or start a new session |
| `tt` / `tto` | tmux attach / detach |
| `lg` | `lazygit` |
| `icat` | render an image in the terminal (chafa, kitty protocol) |
| `sourcevenv` | `source .venv/bin/activate.fish` |
| `python` / `pip` | `python3` / `pip3` |

Project helpers `setup_synthefy`, `setup_agent`, and `start_keymanagement` source their matching
shell scripts.

## Adding your own

- **Alias** — add `alias name 'command'` to `~/.config/fish/config.fish`.
- **Function** — create `~/.config/fish/functions/<name>.fish` containing `function <name> … end`.
  Fish autoloads it on first use; no reload needed.
- **Completion** — create `~/.config/fish/completions/<name>.fish`.
