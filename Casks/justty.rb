cask "justty" do
  version "0.6.5"
  sha256 "8a738dc49f48341fe60d47d609d1afdd686bdd5f163210ee17c8dd86142c8163"

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
    "~/Library/Preferences/dev.0x96f.justty.plist",
    "~/Library/Saved Application State/dev.0x96f.justty.savedState",
  ]
end
