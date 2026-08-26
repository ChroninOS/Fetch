#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────────────────
#  install.sh — Fastfetch & Terminal Aesthetic Suite Installer
#  (Fastfetch + KDE Konsole + Alacritty in VerdArch / Dolphin Teal Theme)
# ──────────────────────────────────────────────────────────────────────────────

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FF_CONFIG_DIR="$HOME/.config/fastfetch"
FF_ASSETS_DIR="$HOME/.local/share/fastfetch"
KONSOLE_DIR="$HOME/.local/share/konsole"
ALACRITTY_DIR="$HOME/.config/alacritty"

# Colors
C_TEAL='\033[38;2;38;166;154m'
C_CYAN='\033[38;2;128;222;234m'
C_BOLD='\033[1m'
C_WARN='\033[38;2;255;213;79m'
C_ERR='\033[38;2;239;83;80m'
C_RST='\033[0m'

echo -e "${C_TEAL}${C_BOLD}"
echo "╔════════════════════════════════════════════════════════╗"
echo "║   🐬 Dolphin Teal / VerdArch Terminal Setup Suite     ║"
echo "╚════════════════════════════════════════════════════════╝"
echo -e "${C_RST}"

deploy_fastfetch() {
    echo -e "${C_CYAN}Deploying Fastfetch configs...${C_RST}"
    mkdir -p "$FF_CONFIG_DIR" "$FF_CONFIG_DIR/presets" "$FF_ASSETS_DIR/logos"
    cp "$SCRIPT_DIR/configs/fastfetch/"*.jsonc "$FF_CONFIG_DIR/presets/" 2>/dev/null || true
    cp "$SCRIPT_DIR/configs/fastfetch/config.jsonc" "$FF_CONFIG_DIR/config.jsonc"
    if [ -d "$SCRIPT_DIR/assets/logos" ]; then
        cp -r "$SCRIPT_DIR/assets/logos/"* "$FF_ASSETS_DIR/logos/" 2>/dev/null || true
    fi
    echo -e "${C_TEAL}✓ Fastfetch configured with Dolphin Teal theme!${C_RST}"
}

deploy_konsole() {
    echo -e "${C_CYAN}Deploying KDE Konsole profile & colorscheme...${C_RST}"
    mkdir -p "$KONSOLE_DIR"
    cp "$SCRIPT_DIR/configs/konsole/Chronin.profile" "$KONSOLE_DIR/"
    cp "$SCRIPT_DIR/configs/konsole/VerdArch.colorscheme" "$KONSOLE_DIR/"
    echo -e "${C_TEAL}✓ Konsole profile (Chronin) & colorscheme (VerdArch) installed!${C_RST}"
}

deploy_alacritty() {
    echo -e "${C_CYAN}Deploying Alacritty configuration...${C_RST}"
    mkdir -p "$ALACRITTY_DIR"
    cp "$SCRIPT_DIR/configs/alacritty/alacritty.toml" "$ALACRITTY_DIR/alacritty.toml"
    echo -e "${C_TEAL}✓ Alacritty configured (VerdArch 0.85 opacity + MesloLGS Nerd Font)!${C_RST}"
}

echo "Select an installation component:"
echo "  1) Full Suite          — Fastfetch + KDE Konsole + Alacritty"
echo "  2) Fastfetch Only      — Deploy Fastfetch configs & presets"
echo "  3) KDE Konsole Only    — Install Chronin.profile & VerdArch colorscheme"
echo "  4) Alacritty Only      — Install matching alacritty.toml"
echo "  5) Cancel"
echo ""

read -rp "Enter choice [1-5]: " choice

case "$choice" in
    1)
        deploy_fastfetch
        deploy_konsole
        deploy_alacritty
        ;;
    2)
        deploy_fastfetch
        ;;
    3)
        deploy_konsole
        ;;
    4)
        deploy_alacritty
        ;;
    5)
        echo "Installation canceled."
        exit 0
        ;;
    *)
        echo -e "${C_ERR}Invalid option. Aborted.${C_RST}"
        exit 1
        ;;
esac

echo ""
echo -e "${C_TEAL}${C_BOLD}Testing Fastfetch output:${C_RST}"
echo ""
fastfetch
echo ""
echo -e "${C_TEAL}All done!${C_RST}"
