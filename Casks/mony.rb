cask "mony" do
  version "0.4.2"
  sha256 "c281a83d78e208e8f50abf9f0e515dd5b27c3a4372de371fff685e94f5ae54fa"

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
