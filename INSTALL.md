## Installation

Mony needs macOS 13 or later on a Mac with Apple Silicon. It is free but not notarized by Apple, so how you install it decides whether macOS asks you to confirm it. Options 1 and 2 open Mony right away.

### Option 1: Terminal (recommended)

```sh
curl -fsSL https://raw.githubusercontent.com/geezowl/mony/stable/install.sh | bash
```

Downloads the latest release, installs `MonyBar.app` into Applications (replacing an older copy), and opens it. Run the same command again to update.

### Option 2: Homebrew

```sh
brew tap geezowl/mony https://github.com/geezowl/mony
brew install --cask geezowl/mony/mony
```

Update with `brew update && brew upgrade --cask geezowl/mony/mony`.

### Option 3: DMG from this page

1. Download `Mony-<version>.dmg` below, open it, and drag `MonyBar.app` into **Applications**.
2. Open `MonyBar.app`. macOS says **"MonyBar.app" Not Opened**. Click **Done** (not Move to Trash).
3. Open **System Settings → Privacy & Security** and scroll down to **Security**. Next to *"MonyBar.app" was blocked to protect your Mac*, click **Open Anyway**, then enter your password.
4. Click **Open** in the dialog that follows. macOS remembers this, so you only do it once per install.

Or skip steps 2 to 4 by running this in Terminal after step 1:

```sh
xattr -dr com.apple.quarantine /Applications/MonyBar.app
```

### Updating

When a new version is out, Mony shows a banner at the top of its menu. **Update with Homebrew** or **Download DMG** from that banner never triggers the prompt above.

### CLI

Download `Mony-<version>-monyctl.zip`, unzip it, then run `xattr -cr monyctl && chmod +x monyctl && mv monyctl /usr/local/bin/`.
