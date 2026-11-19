# Mony

Control the **brightness, contrast, resolution and color profile** of external monitors from an Apple Silicon Mac, whatever the monitor brand. Free.

<p>
  <img src="images/popover-light.png" width="300" alt="MonyBar light">
  <img src="images/popover-dark.png" width="300" alt="MonyBar dark">
</p>

## Download

Get the latest stable version from [Releases](../../releases/latest):

| File | Contents |
|---|---|
| `Mony-<version>.dmg` | The `MonyBar.app` menu bar app with sliders, recommended resolutions, presets and hotkeys |
| `Mony-<version>-monyctl.zip` | CLI for scripts and shortcuts |

The release marked **Latest** on the Releases page is always the recommended stable version.

## Requirements

macOS 13+ on Apple Silicon. The monitor must have DDC/CI enabled in its OSD menu for hardware brightness control.

## Installation

The quickest way, which also opens Mony without any macOS security prompt:

```sh
curl -fsSL https://raw.githubusercontent.com/geezowl/mony/stable/install.sh | bash
```

Or with Homebrew:

```sh
brew tap geezowl/mony https://github.com/geezowl/mony
brew install --cask geezowl/mony/mony
```

Installing from the DMG is also possible, but because Mony is not notarized, macOS blocks the first launch until you allow it in **System Settings → Privacy & Security → Open Anyway**. See [INSTALL.md](INSTALL.md) for every option step by step; the same guide is attached to each release.

### Updating

MonyBar checks GitHub for a new release whenever you open its menu (at most once an hour). When one is out, a banner appears at the top of the menu and a small dot on the menu bar icon. From the banner you choose how to update, and neither way triggers the security prompt:

- **Update with Homebrew** runs Homebrew in the background and reopens Mony when it's done (shown only when Homebrew is installed).
- **Download DMG** saves the new installer to your Downloads folder and opens it. Quit Mony, drag `MonyBar.app` into Applications to replace the old one, and open it again.

The status and a **Check Now** button are in Settings. Checking can be turned off in **Settings → Check for updates**.

## Features

- Brightness and contrast for external monitors over DDC/CI; the built-in display through DisplayServices.
- Software dimming (gamma) fallback for monitors without DDC.
- Resolution: 5 recommended choices by default ("Larger Text" to "More Space"); advanced mode lists every mode.
- Per-display ICC color profile, with a button to reset to the factory profile.
- Presets: save and apply brightness, contrast, resolution and color profile together.
- Brightness sync across all monitors and global hotkeys ⌃⌥⌘ ↑/↓.
- In-app updates with Homebrew or the DMG.

## License

Freeware. Free to use and share unmodified; the source code is not released. See [LICENSE](LICENSE).

## Issues

Report them in [Issues](../../issues). Set `MONY_DEBUG=1` to log raw DDC traffic to stderr and attach it to your report.
