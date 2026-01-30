#!/bin/bash
# --- Dependency & Backup Script (Part 2) ---

# Load colors from a utility file if you have one, or define here
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RC='\033[0m'

# 1. Backup Function: Safely moves existing configs
backup_config() {
    local target="$1"
    if [ -e "$target" ]; then
        printf "%b\n" "${YELLOW}Backing up $target to ${target}.bak${RC}"
        mv "$target" "${target}.bak"
    fi
}

# 2. Install Logic: Uses the PM detected in Script 1
install_packages() {
    local PM=$1
    local DEPS=("fastfetch" "curl" "chafa") # chafa helps with terminal image rendering

    printf "%b\n" "${GREEN}Updating system and installing dependencies via $PM...${RC}"

    case "$PM" in
        pacman)
            sudo pacman -S --needed --noconfirm "${DEPS[@]}"
            ;;
        apt-get)
            sudo apt-get update && sudo apt-get install -y "${DEPS[@]}"
            ;;
        dnf)
            sudo dnf install -y "${DEPS[@]}"
            ;;
        *)
            printf "%b\n" "${YELLOW}Unsupported PM. Please install ${DEPS[*]} manually.${RC}"
            exit 1
            ;;
    esac
}

# --- Execution ---
# Note: In a real flow, $PM comes from your Script 1 logic
PM_DETECTED=$(command -v pacman >/dev/null && echo "pacman" || echo "apt-get")

# Backup existing Fastfetch and Bash profile
backup_config "$HOME/.config/fastfetch"
backup_config "$HOME/.bashrc"

# Run installation
install_packages "$PM_DETECTED"

printf "%b\n" "${GREEN}Step 2 Complete: Environment is backed up and dependencies installed.${RC}"
