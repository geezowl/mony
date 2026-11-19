cask "mony" do
  version "0.5.2"
  sha256 "c4d87541ff43b1c78709680060202384c5f66a74b0bea201f911db23053fd33c"

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
