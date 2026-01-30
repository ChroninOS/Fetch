# 🚀 Custom Fastfetch & Bash Aesthetic Setup

A cross-distro automation script to beautify your terminal with a custom PNG logo, transparent background, and a sleek Bash prompt. Optimized for **KDE Konsole** and modern terminal emulators.

![Terminal Preview](assets/preview.png)

## ✨ Features
- **Smart Detection**: Identifies your distro (Arch, Ubuntu, Fedora) and terminal capabilities.
- **PNG Logo Support**: Automatically configures Fastfetch to render high-res images.
- **Modern Prompt**: A customized `PS1` with vibrant colors.
- **Safe Setup**: Automatically backups your existing `.bashrc` and `fastfetch` configs.
- **Transparency**: Auto-configures Konsole profiles for that 90% opacity look.

## 🛠️ One-Line Installation

Open your terminal and paste the following:

```bash
curl -sSL https://raw.githubusercontent.com | bash

### **Important Implementation Tips:**

1.  **The Preview Image**: Ensure you save your screenshot as `assets/preview.png` in the repo so the link in the README works immediately.
2.  **The One-Liner**: Replace `YOUR_USERNAME` and `YOUR_REPO_NAME` in the `curl` command. Note that pipe-to-bash is popular but usually requires your `install.sh` to be self-contained or use absolute URLs to fetch the other script parts.
3.  **Local Testing**: Before pushing to GitHub, test your script locally by running `chmod +x install.sh && ./install.sh`.

For professional Bash practices, check out the [Google Shell Style Guide](https://google.github.io) to keep your code clean.