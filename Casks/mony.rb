cask "mony" do
  version "0.3.0"
  sha256 "48584d23ef70beced91d20c7232831216c044371ea6457d0052bf3a3ac6b56b0"

  url "https://github.com/geezowl/mony/releases/download/v#{version}/Mony-#{version}.dmg"
  name "Mony"
  desc "Adjust brightness, contrast, resolution and color profile of external monitors"
  homepage "https://github.com/geezowl/mony"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "MonyBar.app"

  zap trash: "~/Library/Application Support/Mony"

  caveats <<~EOS
    MonyBar is not notarized. If macOS blocks it on first launch, run:
      xattr -cr #{appdir}/MonyBar.app
  EOS
end
