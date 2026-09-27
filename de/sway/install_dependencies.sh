#!/usr/bin/env bash

set -e

echo "Updating package list..."
sudo apt update

echo "Installing Sway and dependencies..."

sudo apt install -y \
    sway \
    swaybg \
    swayidle \
    swaylock \
    xwayland \
    waybar \
    mako-notifier \
    fuzzel \
    wl-clipboard \
    cliphist \
    grim \
    slurp \
    brightnessctl \
    playerctl \
    pipewire \
    pipewire-audio \
    wireplumber \
    network-manager \
    network-manager-gnome \
    bluez \
    blueman \
    udisks2 \
    udiskie \
    polkit-kde-agent-1 \
    xfce4-terminal \
    thunar \
    dbus-user-session \
    xdg-desktop-portal \
    xdg-desktop-portal-wlr \
    xdg-desktop-portal-gtk \
    fonts-noto \
    fonts-noto-color-emoji \
    nwg-displays \
    nwg-look \
    qtwayland5 \
    qt6-wayland \
    git \
    curl \
    jq

echo
echo "Enabling required services..."

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

echo
echo "Dependencies installed successfully."
