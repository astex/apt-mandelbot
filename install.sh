#!/usr/bin/env sh
set -eu

REPO_URL="https://astex.github.io/apt-mandelbot"
KEYRING="/usr/share/keyrings/mandelbot.gpg"
SOURCES="/etc/apt/sources.list.d/mandelbot.list"

need_sudo() {
  if [ "$(id -u)" -ne 0 ]; then
    if command -v sudo >/dev/null 2>&1; then
      echo "sudo"
    else
      echo "Error: this script must be run as root or with sudo available." >&2
      exit 1
    fi
  fi
}

SUDO=$(need_sudo)

echo "Adding mandelbot APT repository..."

curl -fsSL "$REPO_URL/key.gpg" | $SUDO gpg --dearmor -o "$KEYRING"
echo "deb [signed-by=$KEYRING] $REPO_URL stable main" | $SUDO tee "$SOURCES" >/dev/null

$SUDO apt-get update -o Dir::Etc::sourcelist="$SOURCES" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0" -qq
$SUDO apt-get install -y mandelbot

echo "mandelbot installed successfully."
