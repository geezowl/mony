cask "mony" do
  version "0.4.3"
  sha256 "6c4992b608648b43f6c6a4b899eb35b9ff1e0052538620f36ceaacaef5fea85b"

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
