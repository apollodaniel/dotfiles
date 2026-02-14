#!/bin/bash

# Install all dependencies used by the i3wm config files.
# Requires: pacman + yay (AUR helper)
# Distro: CachyOS / Arch Linux

set -e

# --- Pacman packages (official repos) ---
PACMAN_PKGS=(
    # Window manager & bar
    i3-wm
    i3status
    i3lock

    # X11 utilities
    xorg-xrandr
    xorg-xset
    xss-lock
    dex

    # Launcher & notifications
    rofi
    dunst

    # Terminal & file manager
    kitty
    nemo

    # Screenshot & clipboard
    maim
    slop
    xclip

    # Audio control (pactl)
    libpulse

    # Networking & keyring
    network-manager-applet
    gnome-keyring

    # Rofi window switcher dep
    wmctrl

    # Icon theme (used by rofi)
    papirus-icon-theme

    # Misc
    xdg-utils

    # Shell
    zsh
)

# --- AUR packages (via yay) ---
AUR_PKGS=(
    rofi-greenclip       # clipboard manager for rofi
    rofi-bluetooth-git   # bluetooth menu for rofi
    boomer-git           # zoom tool
    nightshift           # blue light filter
)

echo "=== Installing pacman packages ==="
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

echo ""
echo "=== Installing AUR packages (yay) ==="
yay -S --needed --noconfirm "${AUR_PKGS[@]}"

echo ""
echo "=== Installing Oh My Zsh ==="
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "  Oh My Zsh is already installed, skipping."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo ""
echo "=== All dependencies installed ==="
