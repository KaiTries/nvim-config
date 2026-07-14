# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a bare Neovim configuration (no distro) using lazy.nvim as plugin manager. Requires Neovim 0.11+.

- `init.lua` — requires the four `config.*` modules in order: options, lazy, keymaps, autocmds.
- `lua/config/options.lua` — loaded first, before plugins. Leader keys, `vim.opt` settings, and environment setup (e.g. PATH injection for `~/.dotnet/tools`, razor filetype registration).
- `lua/config/lazy.lua` — bootstraps lazy.nvim and imports `lua/plugins/`.
- `lua/config/keymaps.lua` — all custom keymaps (plugin-specific keymaps live in their plugin spec's `keys`).
- `lua/config/autocmds.lua` — custom autocmds.
- `lua/plugins/` — one file per plugin group. Each file returns a lazy.nvim plugin spec table.

## Plugin Management

Plugins are managed via lazy.nvim. To add a plugin, create or edit a file in `lua/plugins/` returning a spec table. Run `:Lazy sync` inside Neovim to install/update.

Key plugins:
- `snacks.nvim` — picker, explorer (hidden files enabled), lazygit, notifier, indent guides. Most `<leader>f`/`<leader>s` and LSP navigation keymaps live in its spec.
- `blink.cmp` — completion (accept with Enter).
- `nvim-treesitter` — **main branch** (new API): parsers installed via `require("nvim-treesitter").install()`, highlighting started by a `FileType` autocmd calling `vim.treesitter.start()`. Requires the `tree-sitter` CLI (installed via mason).
- `conform.nvim` — formatting; format-on-save respects `vim.g.autoformat` / `vim.b.autoformat` (toggle with `<leader>uf`). Razor buffers set `vim.b.autoformat = false` in options.lua.
- `nvim-lspconfig` + `mason-lspconfig` — installs and enables `lua_ls` and `jsonls` via `vim.lsp.config`/`vim.lsp.enable` (Neovim 0.11+ pattern).

The Mason registry includes `github:Crashdummyy/mason-registry` (required for Roslyn).

## .NET / C#

- `lua/plugins/roslyn.lua` configures roslyn.nvim for C#/razor, including a workaround filtering malformed Roslyn diagnostics.
- `~/.dotnet/tools` is injected into PATH in options.lua.
- C# formatting uses csharpier (mason-installed) via conform.nvim.
- Open Neovim from the directory containing the `.sln` file for full cross-project Roslyn navigation.
