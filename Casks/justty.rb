cask "justty" do
  version "0.7.1"
  sha256 "553c82d3a90a2d5657ad66a4f2b1ac4a9b6e38bbed9415cfb9236b3fec4bcb8c"

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
