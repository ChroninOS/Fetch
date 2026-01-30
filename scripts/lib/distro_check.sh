#!/bin/bash

# --- Environment Detection Script (Part 1) ---

# Detect Package Manager
get_package_manager() {
    if command -v pacman >/dev/null 2>&1; then
        echo "pacman"
    elif command -v apt-get >/dev/null 2>&1; then
        echo "apt-get"
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf"
    else
        echo "unknown"
    fi
}

# Check for PNG Compatibility (Primary focus: KDE Konsole)
check_terminal_support() {
    local term_prog="${TERM_PROGRAM:-"unknown"}"
    
    echo "Detected Terminal: $term_prog"
    
    case "$term_prog" in
        "Konsole")
            echo "PNG support: [YES] (KDE Konsole detected)"
            return 0
            ;;
        "Apple_Terminal")
            echo "PNG support: [NO] (Standard macOS terminal uses ASCII only)"
            return 1
            ;;
        *)
            # Fallback check for modern protocols like Kitty or Sixel
            if [[ "$TERM" == "xterm-kitty" ]]; then
                echo "PNG support: [YES] (Kitty protocol)"
                return 0
            fi
            echo "PNG support: [MAYBE] (Testing required for this terminal)"
            return 1
            ;;
    esac
}

# --- Testing the logic ---
PM=$(get_package_manager)
echo "System Package Manager: $PM"

if check_terminal_support; then
    echo "Status: Ready for PNG logo customization."
else
    echo "Status: Suggesting ASCII logo fallback."
fi
