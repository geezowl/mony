cask "mony" do
  version "0.5.0"
  sha256 "f8b7609fa61a78bd6cc457cb3051d571b6abf5ced0cea1007de7872382b83997"

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
