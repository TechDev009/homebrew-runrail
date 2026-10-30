# Written by Runrail Desktop's publish workflow for each release; edits here are replaced.
cask "runrail" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "08f13a702d34e969194187293353e661c37674161c33f3061ba9326a8b856d78",
         intel: "1eb57b78a78e6c1422d26b35dcd1a159c4fa96bc6663f721d56bad2abf7221ef"

  url "https://github.com/TechDev009/runrail-desktop/releases/download/v#{version}/Runrail_#{version}_#{arch}.dmg"
  name "Runrail"
  desc "Desktop app for supervised local coding agents"
  homepage "https://github.com/TechDev009/runrail-desktop"

  # The app updates itself from signed GitHub releases, when you ask it to.
  auto_updates true
  depends_on macos: :ventura

  app "Runrail.app"

  uninstall launchctl: "com.runrail.desktop.wake"

  zap trash: [
    "~/Library/Application Support/com.runrail.desktop",
    "~/Library/Caches/com.runrail.desktop",
    "~/Library/Preferences/com.runrail.desktop.plist",
    "~/Library/Saved Application State/com.runrail.desktop.savedState",
    "~/Library/WebKit/com.runrail.desktop",
  ]
end
