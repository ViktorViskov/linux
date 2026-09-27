#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config-backup/$(date +%Y%m%d-%H%M%S)"

mkdir -p "$CONFIG_DIR"
mkdir -p "$BACKUP_DIR"

if [ -d "$CONFIG_DIR/sway" ]; then
    echo "Backing up existing Sway config..."
    mv "$CONFIG_DIR/sway" "$BACKUP_DIR/"
fi

if [ -d "$CONFIG_DIR/waybar" ]; then
    echo "Backing up existing Waybar config..."
    mv "$CONFIG_DIR/waybar" "$BACKUP_DIR/"
fi

echo "Copying Sway config..."
cp -r sway "$CONFIG_DIR/"

echo "Copying Waybar config..."
cp -r waybar "$CONFIG_DIR/"

echo
echo "Done."
echo "Backup: $BACKUP_DIR"
