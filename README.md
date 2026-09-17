# Dotfiles

Personal dotfiles and development environment configurations for macOS, maintained by Krzysztof Zielonka.

> 🤖 **Note:** This configuration, modular architecture, and documentation were crafted and structured with the assistance of AI.

This repository is kept public on GitHub to enable reproducible, automated setups across new machines and clean disaster recovery.

---

## 📂 Repository Structure

```text
dotfiles/
├── .gitignore
├── README.md
└── nvim/                  # Neovim configuration (symlinked to ~/.config/nvim)
    ├── init.lua
    └── lua/
        ├── config/        # Options, keymaps, autocommands, lazy bootstrap
        └── plugins/       # Modular plugin specifications
```

---

## 🚀 Setting Up on a New Machine

### 1. Prerequisites (macOS)

Install Homebrew and the core CLI dependencies:

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Neovim & fast search utilities (used by Telescope and file finders)
brew install neovim ripgrep fd
```

### 2. Clone Repository

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
```

### 3. Symlink Configurations

Create the symlink from your central dotfiles to standard configuration paths:

```bash
mkdir -p ~/.config
ln -s ~/dotfiles/nvim ~/.config/nvim
```

### 4. Launch Neovim

```bash
nvim
```

On first launch:
- **`lazy.nvim`** will automatically clone itself and install all plugins.
- **`mason.nvim`** will automatically download language servers (Go, TypeScript, Ruby, Lua) and formatters in the background.
- Treesitter will compile language grammars.

---

## ⌨️ Keyboard Shortcuts Cheatsheet

Leader key is set to `<Space>`.

### Window & Split Navigation
| Shortcut | Action |
| :--- | :--- |
| `Ctrl + h` | Focus window to the left |
| `Ctrl + j` | Focus window below |
| `Ctrl + k` | Focus window above |
| `Ctrl + l` | Focus window to the right |
| `Ctrl + Up` / `Down` | Resize window height |
| `Ctrl + Left` / `Right` | Resize window width |

### Buffers & File Navigation
| Shortcut | Action |
| :--- | :--- |
| `<leader>e` | Toggle Neo-tree sidebar file explorer |
| `-` | Open parent directory with Oil (edit files as buffer) |
| `<S-h>` or `[b` | Switch to previous buffer |
| `<S-l>` or `]b` | Switch to next buffer |
| `<leader>bd` | Close current buffer |

### Editing & Text Manipulation
| Shortcut | Action |
| :--- | :--- |
| `<Esc>` | Clear active search highlights |
| `J` (in Visual mode) | Move selected block down |
| `K` (in Visual mode) | Move selected block up |
| `p` (in Visual mode) | Paste over selection without losing your paste buffer |
| `Ctrl + d` / `Ctrl + u` | Scroll down / up (keeps cursor centered) |

### Diagnostics & Errors
| Shortcut | Action |
| :--- | :--- |
| `<leader>d` | **Open floating window with full TS / linter error details** |
| `[d` / `]d` | Jump to previous / next diagnostic |
| `<leader>cd` or `gl` | Open diagnostic hover window for current line |
| `<leader>q` | Send diagnostics to quickfix/location list |

### 🔍 Fuzzy Finder & Search (Telescope)
| Shortcut | Action |
| :--- | :--- |
| `<leader>ff` | Find files by name (fast, respects gitignore) |
| `<leader>fg` | Live grep (search text across all files) |
| `<leader>fb` | Search and switch between open buffers |
| `<leader>fr` | Search recently opened files |
| `<leader>fs` | Search word under cursor across project |
| `<leader>fh` | Search Neovim help documentation tags |

### 🧠 Code Intelligence & LSP
| Shortcut | Action |
| :--- | :--- |
| `gd` | Jump to definition |
| `gD` | Jump to declaration |
| `gr` | Find references (in Telescope popup) |
| `gi` | Jump to implementation |
| `<leader>D` | Jump to type definition |
| `K` | Hover documentation popup |
| `<leader>ca` | Code actions (import fixes, quick repairs) |
| `<leader>rn` | Rename symbol across project |
| `<leader>cf` | Format code manually (auto-formats on save) |
| `<leader>cm` | Open Mason package manager dashboard |

### 🌿 Git & Version Control (Gitsigns)
| Shortcut | Action |
| :--- | :--- |
| `]c` / `[c` | Jump to next / previous changed hunk |
| `<leader>hp` | Preview git diff hunk at cursor |
| `<leader>hs` | Stage current git hunk |
| `<leader>hr` | Reset/discard changes in current git hunk |
| `<leader>hb` | Toggle git blame line for current line |
| `<leader>hd` | Open full git diff view against index |

---

## 🔒 Security & Privacy Note

This repository is public. **Never commit sensitive credentials, API keys, private SSH/GPG keys, or confidential tokens to this repository.** Any machine-specific secrets should live outside version control (e.g., in `~/.zshrc.local` or environment variables).
