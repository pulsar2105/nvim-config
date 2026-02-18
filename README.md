# nvim-config
Configuration files of my personal nvim.

## Requirements

- `nvim` >= 0.9
- `tree-sitter` CLI for syntax highlighting in telescope preview.
- `ripgrep` for live grep in telescope.
- `fd` for file searching in telescope.
- `luarocks`

## Keymaps

- `S-i` / `S-k` in visual mode to move up/down a selected block of texte.
- `<leader>ls` load the current session.
- `<leader>lS` select a session to load.
- `<leader>sl` load the last session.
- `<leader>sd` stop Persistence => session won't be saved on exit.

## Plugins

`:Lazy` to open the plugin manager.
