#!/bin/bash
# --- The Master Installer ---

set -e # Exit on error

# Load Libs
source scripts/lib/distro_check.sh

clear
echo "Starting Terminal Customization..."

# 1. Audit & Install Deps
PM=$(get_package_manager)
source scripts/install-deps.sh $PM

# 2. Deploy Assets & Fastfetch
source scripts/setup-config.sh

# 3. Setup Shell & Aesthetics
source scripts/setup-shell.sh

printf "%b\n" "${GREEN}Installation complete! Restart your terminal to see changes.${RC}"
