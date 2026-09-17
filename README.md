# Dotfiles

Personal dotfiles and development environment configurations for macOS, maintained by Krzysztof Zielonka.

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

## 🔒 Security & Privacy Note

This repository is public. **Never commit sensitive credentials, API keys, private SSH/GPG keys, or confidential tokens to this repository.** Any machine-specific secrets should live outside version control (e.g., in `~/.zshrc.local` or environment variables).
