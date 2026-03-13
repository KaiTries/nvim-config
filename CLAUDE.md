# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a [LazyVim](https://github.com/LazyVim/LazyVim)-based Neovim configuration. LazyVim provides the base setup; customizations live in `lua/config/` and `lua/plugins/`.

- `lua/config/options.lua` — loaded first, before plugins. Used for `vim.opt` settings and environment setup (e.g. PATH injection for `~/.dotnet/tools`).
- `lua/config/keymaps.lua` — loaded on `VeryLazy` event. All custom keymaps go here.
- `lua/config/lazy.lua` — bootstraps lazy.nvim and defines the plugin spec (imports LazyVim defaults + `lua/plugins/`).
- `lua/plugins/` — one file per plugin group. Each file returns a lazy.nvim plugin spec table.

## Plugin Management

Plugins are managed via lazy.nvim. To add a plugin, create or edit a file in `lua/plugins/` returning a spec table. Run `:Lazy sync` inside Neovim to install/update.

The Mason registry includes `github:Crashdummyy/mason-registry` (required for Roslyn LSP via easy-dotnet).

## .NET / easy-dotnet

- `lua/plugins/easydotnet.lua` configures the full .NET stack: easy-dotnet.nvim, nvim-dap, nvim-dap-ui, nvim-dap-virtual-text, and mason.
- The Roslyn LSP is bundled inside the `EasyDotnet` dotnet global tool (`dotnet-easydotnet`). It must be installed with `dotnet tool install -g EasyDotnet` and requires `~/.dotnet/tools` on PATH — this is injected in `options.lua`.
- LSP settings (inlay hints, code lens, formatting) go in `lsp/easy_dotnet.lua` per the Neovim 0.11+ pattern.
- Open Neovim from the directory containing the `.sln` file for full cross-project Roslyn navigation. If the `.sln` is not in a parent of the current file, Roslyn falls back to project or single-file mode.

## DAP Debugging

The DAP UI opens and closes automatically with debug sessions. Keymaps are all under `<leader>d` — see `lua/config/keymaps.lua` for the full list. `<leader>dd` launches the easy-dotnet project picker to start a debug session.
