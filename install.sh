#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Arch Linux + Sway Dotfiles Installation..."

# 1. YAY (AUR Helper) Check and Installation
if ! command -v yay &> /dev/null; then
    echo "AUR helper 'yay' not found. Installing..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

echo "Updating system repositories and installing dependencies..."

# 2. Official Arch Linux Packages
PACMAN_PKGS=(
    sway swayidle swaylock waybar mako rofi alacritty
    thunar thunar-archive-plugin file-roller
    librewolf imv zathura zathura-pdf-mupdf
    grim slurp swappy wf-recorder cliphist wl-clipboard
    brightnessctl playerctl wireplumber pipewire-audio
    blueman network-manager-applet plasma-systemmonitor
    xdg-desktop-portal-wlr xdg-desktop-portal-gtk
    polkit-kde-agent xdg-user-dirs
    ttf-font-awesome noto-fonts noto-fonts-emoji
    breeze-gtk qt5ct qt6ct
)

sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

# 3. AUR Packages
AUR_PKGS=(
    autotiling
    wlogout
    zapzap
    rofi-emoji
)

yay -S --needed --noconfirm "${AUR_PKGS[@]}"

# 4. Copying Configuration Files
echo "Deploying configuration files to ~/.config/..."

mkdir -p ~/.config
cp -rf "$SCRIPT_DIR/.config/"* ~/.config/

# Initialize XDG User Directories
mkdir -p ~/Downloads ~/Pictures ~/Videos ~/Documents ~/Pictures/Wallpapers/lock-screen
xdg-user-dirs-update

# 5. System Theme & Portal Integration
echo "Applying dark theme configurations..."

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Breeze-Dark'

# Setting Default Applications
xdg-mime default imv.desktop image/png image/jpeg image/webp image/gif
xdg-mime default org.pwmt.zathura.desktop application/pdf

# Set Configuration Permissions
chmod +x ~/.config/sway/config 2>/dev/null || true

echo "Installation complete. Self-cleaning installation directory..."

# 6. Self Cleanup (Removes cloned repository)
cd ~
rm -rf "$SCRIPT_DIR"

echo "Cleanup finished. Start Sway or reload using 'Mod+Shift+C'."
