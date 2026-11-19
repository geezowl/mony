#!/bin/bash
# Installs (or updates) the latest Mony release into /Applications and opens it.
#   curl -fsSL https://raw.githubusercontent.com/geezowl/mony/stable/install.sh | bash
# Mony is not notarized. Files downloaded with curl are not quarantined, so macOS opens the
# app without the "Apple could not verify" prompt that a browser download triggers.
set -euo pipefail

REPO="geezowl/mony"
APPDIR="${APPDIR:-/Applications}"

[ "$(uname -s)" = Darwin ] && [ "$(uname -m)" = arm64 ] || { echo "Mony needs a Mac with Apple Silicon." >&2; exit 1; }

TAG="$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest")"
TAG="${TAG##*/}"
VERSION="${TAG#v}"
[[ "$VERSION" =~ ^[0-9]+(\.[0-9]+)*$ ]] || { echo "Could not find the latest Mony release." >&2; exit 1; }

TMP="$(mktemp -d)"
trap 'hdiutil detach -quiet "$TMP/mnt" 2>/dev/null || true; rm -rf "$TMP"' EXIT

echo "Downloading Mony $VERSION..."
curl -fL --progress-bar -o "$TMP/Mony.dmg" "https://github.com/$REPO/releases/download/$TAG/Mony-$VERSION.dmg"
hdiutil attach -quiet -nobrowse -readonly -mountpoint "$TMP/mnt" "$TMP/Mony.dmg"

if pgrep -xq MonyBar; then
  echo "Quitting the running Mony..."
  osascript -e 'quit app "MonyBar"' >/dev/null 2>&1 || true
  sleep 1
fi

echo "Installing into $APPDIR..."
rm -rf "$APPDIR/MonyBar.app"
cp -R "$TMP/mnt/MonyBar.app" "$APPDIR/"
xattr -dr com.apple.quarantine "$APPDIR/MonyBar.app" 2>/dev/null || true

[ -n "${NO_OPEN:-}" ] || open "$APPDIR/MonyBar.app"
echo "Mony $VERSION is installed. Look for its icon in the menu bar."
