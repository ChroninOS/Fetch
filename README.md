# 🐬 Dolphin Teal Terminal & Fastfetch Suite

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?logo=arch-linux&logoColor=fff&style=flat-square)](https://archlinux.org)
[![Fastfetch](https://img.shields.io/badge/Fastfetch-2.x-brightgreen?style=flat-square)](https://github.com/fastfetch-cli/fastfetch)
[![KDE Konsole](https://img.shields.io/badge/KDE_Konsole-VerdArch-1D99F3?logo=kde&logoColor=fff&style=flat-square)](https://konsole.kde.org)
[![Alacritty](https://img.shields.io/badge/Alacritty-VerdArch-orange?logo=alacritty&logoColor=fff&style=flat-square)](https://alacritty.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-teal.svg?style=flat-square)](LICENSE)

A unified aesthetic configuration suite for **Arch Linux + KDE Plasma**, featuring harmonized setups for **Fastfetch**, **KDE Konsole**, and **Alacritty** styled in the **Dolphin Teal / VerdArch** color palette.

---

## 🎨 Design Philosophy & Color Palette

All configurations across Fastfetch, Konsole, and Alacritty share the exact same 24-bit TrueColor palette:

| Element / Color | Hex Code | RGB | Role |
| :--- | :--- | :--- | :--- |
| **Background** | `#30313a` | `48, 49, 58` | Deep slate-dark background (with 85% opacity / blur) |
| **Foreground** | `#fcfcfc` | `252, 252, 252` | Crisp high-contrast text |
| **Cyan / Teal**| `#1abc9c` | `26, 188, 156` | Primary accents, cursor, selection, and icons |
| **Light Cyan** | `#80deea` | `128, 222, 234` | Secondary gradient & ASCII logo highlights |
| **Light Mint** | `#80cbc4` | `128, 203, 196` | Subdued highlights & badges |
| **Green**      | `#11d116` | `17, 209, 22` | Positive status indicators |
| **Red**        | `#ed1515` | `237, 21, 21` | Alerts and errors |
| **Yellow**     | `#f67400` | `246, 116, 0` | Warnings |

---

## 📦 What's Included

```text
/media/Data/Forge/Fetch/
├── README.md                  # Comprehensive guide & preview
├── install.sh                 # Multi-component setup installer
├── LICENSE                    # MIT License
├── .gitignore
├── configs/
│   ├── fastfetch/             # Fastfetch configs (Default, Tree, Compact, Image)
│   │   ├── config.jsonc
│   │   ├── tree.jsonc
│   │   ├── compact.jsonc
│   │   └── image.jsonc
│   ├── konsole/               # KDE Konsole Profile & Colorscheme
│   │   ├── Chronin.profile
│   │   └── VerdArch.colorscheme
│   └── alacritty/             # Alacritty configuration
│       └── alacritty.toml
└── assets/
    └── logos/                 # Distro logos for image-based fastfetch
```

---

## 🚀 Installation

Run the unified installer to deploy components:

```bash
cd /media/Data/Forge/Fetch
chmod +x install.sh
./install.sh
```

Choose from the interactive menu:
1. **Full Suite**: Deploys Fastfetch + KDE Konsole + Alacritty
2. **Fastfetch Only**: Updates `~/.config/fastfetch/`
3. **KDE Konsole Only**: Installs profile & colorscheme to `~/.local/share/konsole/`
4. **Alacritty Only**: Installs `~/.config/alacritty/alacritty.toml`

---

## 🖥️ Terminal Specifics

### KDE Konsole
- **Profile**: `Chronin.profile` (`MesloLGS Nerd Font`, size 10, blinking beam cursor, hidden scrollbar).
- **Color Scheme**: `VerdArch.colorscheme` (0.85 opacity).

### Alacritty
- **File**: `~/.config/alacritty/alacritty.toml`
- **Settings**: 1:1 color parity with Konsole `VerdArch`, `opacity = 0.85`, `blur = true`, `MesloLGS Nerd Font`, and custom padding.

---

## 📄 License

Distributed under the MIT License. See [LICENSE](LICENSE) for details.
