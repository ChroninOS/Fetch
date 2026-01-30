#!/bin/bash
# --- Deployment & Asset Linking (Part 3) ---

# Define paths relative to the repo root
REPO_ROOT=$(pwd)
FF_CONF_DIR="$HOME/.config/fastfetch"
ASSETS_DIR="$HOME/.local/share/my-custom-fetch"
LOGO_NAME="my-custom-logo.png"

# 1. Prepare Local Asset Directory
# We move the PNG to .local/share so it stays even if the repo is deleted
printf "%b\n" "${YELLOW}Setting up persistent assets...${RC}"
mkdir -p "$ASSETS_DIR"
cp "$REPO_ROOT/assets/logos/$LOGO_NAME" "$ASSETS_DIR/"

# 2. Deploy Fastfetch Config
mkdir -p "$FF_CONF_DIR"

# If config exists, we link yours. 
# We use a 'sed' command to ensure the JSON points to the CORRECT local path of the PNG
printf "%b\n" "${YELLOW}Configuring Fastfetch JSONC...${RC}"

cp "$REPO_ROOT/configs/fastfetch/config.jsonc" "$FF_CONF_DIR/config.jsonc"

# Dynamically update the logo path in the JSON file
# This replaces the placeholder 'LOGO_PATH' in your config.jsonc with the real path
sed -i "s|LOGO_PATH|$ASSETS_DIR/$LOGO_NAME|g" "$FF_CONF_DIR/config.jsonc"

# 3. Apply Terminal Transparency (Example for Konsole)
# Note: Transparency is usually handled via profile files (.profile)
if [ "$TERM_PROGRAM" = "Konsole" ]; then
    printf "%b\n" "${GREEN}Detected Konsole: Applying transparency hints...${RC}"
    # This is where you'd copy your .colorscheme or modify the Konsole profile
    # Example: cp "$REPO_ROOT/configs/terminal/custom.colorscheme" ~/.local/share/konsole/
fi

printf "%b\n" "${GREEN}Step 3 Complete: Assets deployed and config paths mapped.${RC}"
