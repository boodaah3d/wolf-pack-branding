#!/usr/bin/env bash
set -euo pipefail

root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# Omarchy's screensaver uses this literal path, rather than XDG_CONFIG_HOME.
target="$HOME/.config/omarchy/branding/screensaver.txt"
source_file="$root/branding/screensaver.txt"

[[ -s "$source_file" ]] || { echo 'Missing Wolf Pack artwork.' >&2; exit 1; }
if [[ -f "$target" ]] && cmp -s -- "$source_file" "$target"; then
  echo 'Wolf Pack branding is already installed.'
  exit 0
fi
if [[ -d "$target" ]]; then
  echo "Expected a file at $target; found a directory." >&2
  exit 1
fi
mkdir -p -- "$(dirname -- "$target")"
if [[ -e "$target" || -L "$target" ]]; then
  backup="$target.before-wolf-pack.$(date +%Y%m%d-%H%M%S).$$"
  cp -L -- "$target" "$backup"
  echo "Previous artwork backed up to: $backup"
fi
# Replace a symlink itself instead of writing through it into packaged files.
temp=$(mktemp "$(dirname -- "$target")/.wolf-pack.XXXXXXXX")
trap 'rm -f -- "$temp"' EXIT
install -m 644 -- "$source_file" "$temp"
mv -fT -- "$temp" "$target"
echo "Installed Wolf Pack branding: $target"
echo 'It will appear the next time the screensaver starts.'
