# Neovim Config

Personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Requirements

- Neovim 0.11+
- [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-bootstrapped)
- .NET SDK 10+
- [netcoredbg](https://github.com/Samsung/netcoredbg) — installed via Mason
- [EasyDotnet](https://www.nuget.org/packages/EasyDotnet) global tool — `dotnet tool install -g EasyDotnet`
- A [Nerd Font](https://www.nerdfonts.com/) for icons

## Plugins

### Core
- **[LazyVim](https://github.com/LazyVim/LazyVim)** — base config and plugin manager
- **[mason.nvim](https://github.com/mason-org/mason.nvim)** — LSP/tool installer (includes [Crashdummyy/mason-registry](https://github.com/Crashdummyy/mason-registry) for Roslyn)

### .NET Development
- **[easy-dotnet.nvim](https://github.com/GustavEikaas/easy-dotnet.nvim)** — .NET project management, Roslyn LSP, debugging, test runner
  - Roslyn LSP with Roslynator analyzers
  - Build, run, test from within Neovim
  - Solution/project auto-detection

### Debugging (DAP)
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** — debug adapter protocol client
- **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** — debug UI panels (auto-opens on session start)
- **[nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)** — inline variable values during debugging

## Keymaps

### Debugging

| Key | Action |
|-----|--------|
| `<leader>dd` | Pick and debug a .NET project |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Continue |
| `<leader>dn` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dq` | Terminate session |
| `<leader>dr` | Restart |
| `<leader>dl` | Re-run last config |
| `<leader>dR` | Toggle REPL |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Eval expression / selection |

## Installation

```bash
git clone git@github.com:KaiTries/nvim-config.git ~/.config/nvim
nvim
```

Lazy will auto-install all plugins on first launch. Then install the .NET global tool:

```bash
dotnet tool install -g EasyDotnet
```

## Notes

- `~/.dotnet/tools` is added to Neovim's PATH via `lua/config/options.lua` so `dotnet-easydotnet` is discoverable by the LSP.
- Open Neovim from the solution root (where the `.sln` file lives) for full cross-project Roslyn navigation.
