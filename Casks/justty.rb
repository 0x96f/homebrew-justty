cask "justty" do
  version "0.6.1"
  sha256 "0073731048d2f13fb59e00cf64e1035dfa03d4a9c5734009dac361021ad936dc"

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
