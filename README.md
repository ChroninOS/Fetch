# 🐬 Dolphin Teal Fastfetch Configurations

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?logo=arch-linux&logoColor=fff&style=flat-square)](https://archlinux.org)
[![Fastfetch](https://img.shields.io/badge/Fastfetch-2.x-brightgreen?style=flat-square)](https://github.com/fastfetch-cli/fastfetch)
[![KDE Plasma](https://img.shields.io/badge/KDE_Plasma-Dolphin_Teal-1D99F3?logo=kde&logoColor=fff&style=flat-square)](https://kde.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-teal.svg?style=flat-square)](LICENSE)

A curated collection of modern, aesthetically pleasing **Fastfetch** configurations styled in harmonious **Dolphin Teal** (`#26a69a`, `#80deea`, `#80cbc4`) and **Adwaita Dark** hues.

Designed specifically to complement our [Dolphin Teal Powerline Bash Prompt](https://github.com/ChroninOS/Prompt) for **Arch Linux + KDE Plasma**.

---

## ✨ Features

- 🎨 **Dolphin Teal Color Palette**: 24-bit TrueColor accents and gradients matching KDE Dolphin and dark desktop aesthetics.
- 🔠 **Nerd Font Integration**: Carefully curated icons for OS, Kernel, Uptime, DE/WM, CPU, GPU, Memory, Swap, and Disks.
- 📊 **Dynamic Percentages & Status Bars**: Color-coded usage meters with smooth UTF-8 progress indicators.
- 🧩 **Multiple Preset Layouts**:
  - **`config.jsonc` (Default)**: Modern cards with clean Arch ASCII art.
  - **`tree.jsonc`**: Grouped categories (*SYSTEM*, *DESKTOP*, *HARDWARE*) with tree branches (`├`, `└`).
  - **`compact.jsonc`**: Minimalist small ASCII view with core hardware and desktop stats.
  - **`image.jsonc`**: High-resolution PNG logo rendering via Chafa / Kitty graphics protocol.
- 🛡️ **Safe Installer**: Automatically creates timestamped backups of existing `~/.config/fastfetch` configurations.

---

## 📸 Presets Overview

### 1. Default (Dolphin Teal Card)
```text
                   .                     chronin@Arch
                  / \                    ────────────
                 /   \                   󰣇 󰑃 Arch Linux 
                /     \                  󰌢 󰑃 MS-7C96 1.0
               /       \                  󰑃 Linux 7.2.0-1-cachyos
              />,       \                 󰑃 15 mins
             /  `*.      \               󰏖 󰑃 1088 (pacman)
            /      `      \               󰑃 bash 5.3.15
           /               \             󰍹 󰑃 1920x1080 @ 75Hz
          /                 \             󰑃 KDE Plasma 6.7.4
         /      ,.-+-..      \            󰑃 KWin (Wayland)
        /      ,/'   `\.      \          󰉼 󰑃 Breeze (ArcDark) [Qt]
       /      .|'     `|.   _  \         󰀻 󰑃 Tela-manjaro [Qt]
      /       :|.     ,|;    `+.\        󰆿 󰑃 Breeze_Light (24px)
     /        .\:     ;/,      "<\        󰑃 konsole 26.8.0
    /     __,--+"     "+--.__     \       󰑃 AMD Ryzen 5 5600G
   /  _,+'"                 "'+._  \     󰾲 󰑃 Radeon Vega Series [Integrated]
  /,-'                           `-.\     󰑃 2.20 GiB / 7.15 GiB (31%)
 '                                   '   󰓡 󰑃 0 B / 4.00 GiB (0%)
                                         󰋊 󰑃 29.97 GiB / 97.87 GiB (31%)
                                         
                                         ● ● ● ● ● ● ● ●
```

### 2. Tree-Structured Preset (`tree.jsonc`)
Categorized view with branch connectors separating System, Desktop, and Hardware.

### 3. Compact Minimal (`compact.jsonc`)
Compact single-column view using `arch_small` ASCII art for small terminal windows.

---

## 🚀 Installation

### Automated Setup

1. Clone or navigate to the repository:
   ```bash
   cd /media/Data/Forge/Fetch
   ```
2. Make the installer executable and run it:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
3. Select your preferred layout from the interactive menu.

---

## ⚙️ Manual Preset Switching

All preset configurations are stored in `~/.config/fastfetch/presets/`. You can test or switch to any preset at any time:

```bash
# Test a preset without overwriting your default:
fastfetch -c ~/.config/fastfetch/presets/tree.jsonc
fastfetch -c ~/.config/fastfetch/presets/compact.jsonc

# Apply a preset as your primary config:
cp ~/.config/fastfetch/presets/tree.jsonc ~/.config/fastfetch/config.jsonc
```

---

## 🔤 Requirements

- **Fastfetch**: `sudo pacman -S fastfetch`
- **Nerd Font**: MesloLGS Nerd Font / JetBrains Mono Nerd Font
- **Terminal Emulator**: 24-bit TrueColor support (KDE Konsole, Alacritty, Kitty, WezTerm)

---

## 📄 License

Distributed under the MIT License. See [LICENSE](LICENSE) for details.
