cask "mony" do
  version "1.0.0"
  sha256 "f8e580ec660e28fb1d2687ea85776b7011bb12684e598dde36bf68aa59587e38"

  url "https://github.com/geezowl/mony/releases/download/v#{version}/Mony-#{version}.dmg"
  name "Mony"
  desc "Adjust brightness, contrast, resolution and color profile of external monitors"
  homepage "https://github.com/geezowl/mony"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "MonyBar.app"

  # Mony is not notarized; without this, macOS blocks the first launch ("Apple could not verify ...").
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MonyBar.app"]
  end

  zap trash: "~/Library/Application Support/Mony"
end
