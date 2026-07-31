cask "justty" do
  version "0.6.4"
  sha256 "a551cc6cc7c62ccb6aa889905b77bf5e6549549edcb113495c1839a484506ac6"

  url "https://github.com/0x96f/justty/releases/download/v#{version}/Justty-macos.zip"
  name "Justty"
  desc "Simple native macOS terminal"
  homepage "https://github.com/0x96f/justty"

  depends_on macos: :sequoia

  app "Justty.app"

  # Self-signed / not notarized — clear Gatekeeper quarantine so first launch works.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Justty.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.justty.plist",
    "~/Library/Saved Application State/dev.justty.savedState",
  ]
end
