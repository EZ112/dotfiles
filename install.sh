#!/usr/bin/env bash
set -euo pipefail

# Usage: ./install.sh <hostname>

HOSTNAME="${1:-}"
HOSTS_DIR="./nixos/hosts"
DISKO_CONFIG="$HOSTS_DIR/$HOSTNAME/disko.nix"

if [ -z "$HOSTNAME" ]; then
    echo "Usage: ./install.sh <hostname>"
    echo "Available hosts in ./nixos/hosts/:"
    ls "$HOSTS_DIR"
    exit 1
fi

if [ ! -f "$DISKO_CONFIG" ]; then
    echo "Error: Disko configuration for host '$HOSTNAME' not found at '$DISKO_CONFIG'"
    exit 1
fi

echo "==> [1/2] Partitioning disk for '$HOSTNAME'..."
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko "$DISKO_CONFIG"

echo "==> [2/2] Installing NixOS for '$HOSTNAME'..."
sudo nixos-install --flake ".#$HOSTNAME"

echo "==> Done! You can reboot now."
