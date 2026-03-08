# Windows Dotfiles

Personal Windows development environment configuration. A port of my [nix-anywhere](https://github.com/maulanasdqn/nix-anywhere) setup to Windows 11.

## What's Included

```
windows-dotfiles/
├── install.ps1                                  # Automated setup script
├── powershell/
│   └── Microsoft.PowerShell_profile.ps1         # PowerShell profile
├── nvim/                                        # Neovim configuration
│   ├── init.lua                                 # Entry point (lazy.nvim bootstrap)
│   └── lua/
│       ├── options.lua                          # Editor options
│       ├── keymaps.lua                          # Key mappings
│       └── plugins/
│           ├── colorscheme.lua                  # Rose Pine theme
│           ├── treesitter.lua                   # Syntax highlighting
│           ├── telescope.lua                    # Fuzzy finder
│           ├── lsp.lua                          # LSP + Mason + Lspsaga
│           ├── cmp.lua                          # Autocompletion
│           ├── ui.lua                           # NvimTree, Noice, Notify
│           ├── formatting.lua                   # Conform + Autopairs
│           └── claudecode.lua                   # Claude Code integration
└── terminal/
    └── settings.json                            # Windows Terminal settings
```

## Prerequisites

- Windows 11
- [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) (pre-installed on Windows 11)
- [Git](https://git-scm.com/download/win)

## Quick Install

```powershell
git clone https://github.com/maulanasdqn/windows-dotfiles.git ~/dotfiles
cd ~/dotfiles
powershell -ExecutionPolicy Bypass -File install.ps1
```

The install script will automatically install all dependencies and copy configs to the correct locations.

## Manual Install

### 1. Install Dependencies

```powershell
winget install Neovim.Neovim
winget install starship
winget install junegunn.fzf
winget install sharkdp.bat
winget install eza-community.eza
winget install ajeetdsouza.zoxide
winget install DEVCOM.JetBrainsMonoNerdFont
```

### 2. Copy Configs

```powershell
# PowerShell profile
Copy-Item powershell\Microsoft.PowerShell_profile.ps1 $PROFILE -Force

# Neovim
Copy-Item -Recurse nvim $env:LOCALAPPDATA\nvim -Force

# Windows Terminal
Copy-Item terminal\settings.json "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force
```

### 3. Post-Install

1. Set **JetBrainsMono Nerd Font** as your terminal font (should be automatic from `settings.json`)
2. Open `nvim` — lazy.nvim will bootstrap and install all plugins on first launch
3. Mason will auto-install LSP servers

## Tools

| Tool | Description |
|------|-------------|
| [Starship](https://starship.rs) | Cross-shell prompt |
| [eza](https://eza.rocks) | Modern `ls` replacement with icons |
| [bat](https://github.com/sharkdp/bat) | Modern `cat` with syntax highlighting |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` command |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [Neovim](https://neovim.io) | Hyperextensible text editor |

## PowerShell Profile

### Shell Aliases

| Alias | Command |
|-------|---------|
| `c` | `clear` |
| `v` | `nvim` |
| `cl` | `claude` |

### Git Aliases

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `gl` | `git pull` |
| `gco` | `git checkout` |
| `gcb` | `git checkout -b` |

### File Aliases (requires eza)

| Alias | Command |
|-------|---------|
| `ls` | `eza --icons=always` |
| `l` | `eza -l --icons=always` |
| `ll` | `eza -la --icons=always` |
| `la` | `eza -a --icons=always` |
| `lla` | `eza -la --icons=always` |
| `lt` | `eza --tree --icons=always` |

### Other Features

- **History**: 10,000 entries, no duplicates
- **Arrow key search**: Up/Down searches history by prefix
- **bat**: Aliased to `cat` for syntax-highlighted file viewing
- **zoxide**: Smart directory navigation (use `z <partial-path>`)
- **fzf**: Tab completion with fuzzy matching

## Neovim

### Plugin Manager

Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Plugins are auto-installed on first launch.

### Theme

[Rose Pine](https://rosepinetheme.com) (main variant) with transparency enabled.

### LSP Servers (auto-installed via Mason)

| Server | Language |
|--------|----------|
| `lua_ls` | Lua |
| `ts_ls` | TypeScript / JavaScript |
| `eslint` | JS/TS Linting |
| `tailwindcss` | Tailwind CSS |
| `cssls` | CSS |
| `html` | HTML |
| `emmet_ls` | Emmet |
| `jsonls` | JSON |
| `astro` | Astro |
| `taplo` | TOML |
| `rust_analyzer` | Rust (via rustaceanvim) |

### Treesitter Parsers

Vue, TypeScript, TSX, Rust, CSS, HTML, JavaScript, Lua, JSON, YAML, Markdown, Bash, TOML

### Key Mappings

Leader key: `Space`

#### General

| Key | Action |
|-----|--------|
| `<leader>nh` | Clear search highlight |
| `<leader>f` | Toggle file tree (floating) |
| `<leader>t` | Toggle terminal |
| `<leader>mp` | Format file or selection |

#### Navigation (Telescope)

| Key | Action |
|-----|--------|
| `<leader>s` | Find files |
| `<leader>S` | Live grep |
| `<leader>b` | List buffers |

#### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | References |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |

#### Lspsaga

| Key | Action |
|-----|--------|
| `f` | Go to definition (Lspsaga) |
| `F` | Peek definition |
| `D` | Hover doc |
| `Q` | Code action |
| `e` | Next diagnostic |
| `E` | Previous diagnostic |

#### Claude Code

| Key | Action |
|-----|--------|
| `<leader>cc` | Toggle Claude Code |
| `<leader>cs` | Send to Claude (normal/visual) |
| `<leader>co` | Open Claude Code |
| `<leader>cx` | Close Claude Code |

#### Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<C-j>` / `<Down>` | Next item |
| `<C-k>` / `<Up>` | Previous item |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<C-e>` | Abort |
| `<C-b>` / `<C-f>` | Scroll docs |

### Formatting (on save)

| Language | Formatter |
|----------|-----------|
| JS / TS / JSX / TSX / Astro | prettierd / prettier |
| CSS / SCSS / HTML / JSON / YAML / Markdown | prettierd / prettier |
| Rust | rustfmt |
| Lua | stylua |

## Windows Terminal

- **Theme**: Rose Pine
- **Font**: JetBrainsMono Nerd Font
- **Opacity**: 85% with acrylic blur
- **Keybindings**: Ctrl+C (copy), Ctrl+V (paste), Ctrl+Shift+F (find), Alt+Shift+D (split pane)

## Inspired By

This is a Windows port of my NixOS/macOS configuration: [nix-anywhere](https://github.com/maulanasdqn/nix-anywhere)
