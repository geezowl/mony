cask "mony" do
  version "0.5.4"
  sha256 "a59dd5cc3c200db592a3f91f115e21ab792a7bb803da05626a9e46ee6d70f0b7"

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
