#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────────────────
#  install.sh — Fastfetch Aesthetic Setup & Preset Installer
# ──────────────────────────────────────────────────────────────────────────────

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FF_CONFIG_DIR="$HOME/.config/fastfetch"
FF_ASSETS_DIR="$HOME/.local/share/fastfetch"
BACKUP_DIR="$HOME/.config/fastfetch.bak.$(date +%Y%m%d_%H%M%S)"

# Colors
C_TEAL='\033[38;2;38;166;154m'
C_CYAN='\033[38;2;128;222;234m'
C_BOLD='\033[1m'
C_WARN='\033[38;2;255;213;79m'
C_ERR='\033[38;2;239;83;80m'
C_RST='\033[0m'

echo -e "${C_TEAL}${C_BOLD}"
echo "╔════════════════════════════════════════════════════════╗"
echo "║       🚀 Dolphin Teal Fastfetch Setup Installer        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo -e "${C_RST}"

# Check if Fastfetch is installed
if ! command -v fastfetch &>/dev/null; then
    echo -e "${C_WARN}Fastfetch is not installed!${C_RST}"
    echo "Installing fastfetch..."
    if command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm fastfetch
    elif command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y fastfetch
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y fastfetch
    else
        echo -e "${C_ERR}Could not identify package manager. Please install fastfetch manually.${C_RST}"
        exit 1
    fi
fi

# Backup existing config
if [ -d "$FF_CONFIG_DIR" ] && [ "$(ls -A "$FF_CONFIG_DIR" 2>/dev/null)" ]; then
    echo -e "${C_WARN}Backing up existing ~/.config/fastfetch to:${C_RST} $BACKUP_DIR"
    cp -r "$FF_CONFIG_DIR" "$BACKUP_DIR"
fi

mkdir -p "$FF_CONFIG_DIR"
mkdir -p "$FF_CONFIG_DIR/presets"
mkdir -p "$FF_ASSETS_DIR/logos"

# Copy all presets and assets
cp "$SCRIPT_DIR/configs/fastfetch/"*.jsonc "$FF_CONFIG_DIR/presets/" 2>/dev/null || true
if [ -d "$SCRIPT_DIR/assets/logos" ]; then
    cp -r "$SCRIPT_DIR/assets/logos/"* "$FF_ASSETS_DIR/logos/" 2>/dev/null || true
fi

echo ""
echo -e "${C_BOLD}Select your preferred Fastfetch layout:${C_RST}"
echo "  1) Dolphin Teal Default  — Clean, modern cards with Arch ASCII"
echo "  2) Tree Structure        — Grouped by System, Desktop & Hardware with connectors"
echo "  3) Compact Minimal       — Small ASCII logo, essential stats only"
echo "  4) High-Res Image        — Graphical distro logo (using Chafa)"
echo "  5) Cancel"
echo ""

read -rp "Enter choice [1-5]: " choice

case "$choice" in
    1)
        cp "$SCRIPT_DIR/configs/fastfetch/config.jsonc" "$FF_CONFIG_DIR/config.jsonc"
        echo -e "${C_TEAL}✓ Deployed Dolphin Teal Default preset!${C_RST}"
        ;;
    2)
        cp "$SCRIPT_DIR/configs/fastfetch/tree.jsonc" "$FF_CONFIG_DIR/config.jsonc"
        echo -e "${C_TEAL}✓ Deployed Tree Structure preset!${C_RST}"
        ;;
    3)
        cp "$SCRIPT_DIR/configs/fastfetch/compact.jsonc" "$FF_CONFIG_DIR/config.jsonc"
        echo -e "${C_TEAL}✓ Deployed Compact Minimal preset!${C_RST}"
        ;;
    4)
        LOGO_FILE="$FF_ASSETS_DIR/logos/arch-linux.png"
        cp "$SCRIPT_DIR/configs/fastfetch/image.jsonc" "$FF_CONFIG_DIR/config.jsonc"
        sed -i "s|LOGO_PATH|$LOGO_FILE|g" "$FF_CONFIG_DIR/config.jsonc"
        echo -e "${C_TEAL}✓ Deployed High-Res Image preset!${C_RST}"
        ;;
    5)
        echo "Installation canceled."
        exit 0
        ;;
    *)
        echo -e "${C_ERR}Invalid option. Deployed Default preset.${C_RST}"
        cp "$SCRIPT_DIR/configs/fastfetch/config.jsonc" "$FF_CONFIG_DIR/config.jsonc"
        ;;
esac

echo ""
echo -e "${C_TEAL}${C_BOLD}Previewing Fastfetch:${C_RST}"
echo ""
fastfetch
echo ""
echo -e "${C_TEAL}Setup complete! Run 'fastfetch' anytime to see your new layout.${C_RST}"
