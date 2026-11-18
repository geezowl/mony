cask "mony" do
  version "0.4.1"
  sha256 "d7f66bc40a7b9e57c24c2ece131ee756fd5fc95d637be14fbd4099db231582f6"

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
