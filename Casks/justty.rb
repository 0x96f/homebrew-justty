cask "justty" do
  version "0.3.2"
  sha256 "115000f772dc232e89b6e30bd88d33ae4afa6e06c55ba867db54d054c352b0ee"

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
