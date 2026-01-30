#!/bin/bash
# --- Shell Integration & Transparency (Part 4) ---

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RC='\033[0m'

# 1. Deploy Bash Customizations
printf "%b\n" "${YELLOW}Deploying Bash prompt and colors...${RC}"
# Copy our custom prompt file to home
cp "configs/bash/.bash_prompt" "$HOME/.bash_prompt"

# 2. Inject into .bashrc safely
if ! grep -q "source ~/.bash_prompt" "$HOME/.bashrc"; then
    printf "\n# Custom Prompt and Fastfetch\n[ -f ~/.bash_prompt ] && . ~/.bash_prompt\n" >> "$HOME/.bashrc"
    printf "fastfetch\n" >> "$HOME/.bashrc"
fi

# 3. Handle Transparency (Konsole specific)
# Konsole stores profile settings in ~/.local/share/konsole/
if [[ "$TERM_PROGRAM" == "Konsole" ]]; then
    printf "%b\n" "${GREEN}Applying 10%% Transparency to Konsole profile...${RC}"
    # This logic assumes the 'Default' profile; adjust if using a custom name
    PROFILE_FILE=$(grep -l "Default" "$HOME/.local/share/konsole/"*.profile 2>/dev/null | head -n 1)
    if [ -f "$PROFILE_FILE" ]; then
        # Check if Opacity exists, if not append, if yes replace
        if grep -q "Opacity" "$PROFILE_FILE"; then
            sed -i 's/Opacity=.*/Opacity=0.9/' "$PROFILE_FILE"
        else
            printf "[Appearance]\nOpacity=0.9\n" >> "$PROFILE_FILE"
        fi
    fi
fi
