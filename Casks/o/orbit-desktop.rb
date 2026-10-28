cask "orbit-desktop" do
  arch arm: "arm64", intel: "x64"

  version "0.5.2"
  sha256 arm:   "0eae2ade7d567ea832ba4f6df2089543e97ea4635672e40693eeb0dd38a8485a",
         intel: "87ed7a25044f5624c2abd20c45d2b0894adc4f3288e512a4a7a0990347eeac7d"

  url "https://updates.orbitdesktop.com/Orbit-#{version}-#{arch}.dmg"
  name "Orbit"
  desc "Local project workspace for developers"
  homepage "https://orbitdesktop.com/"

  livecheck do
    url "https://updates.orbitdesktop.com/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  conflicts_with cask: "orbit"
  depends_on macos: :ventura

  app "Orbit.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.spacemancodes.orbit.sfl*",
    "~/Library/HTTPStorages/com.spacemancodes.orbit",
    "~/Library/Preferences/ByHost/com.spacemancodes.orbit.ShipIt.*.plist",
    "~/Library/Preferences/com.spacemancodes.orbit.plist",
  ]
end
