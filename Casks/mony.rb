cask "mony" do
  version "0.5.1"
  sha256 "47ddc32e2516ef686221397638657e7af565d43989a1cc689120e70c6e539535"

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
