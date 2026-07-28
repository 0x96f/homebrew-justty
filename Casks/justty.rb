cask "justty" do
  version "0.4.1"
  sha256 "e52f0548a2b6705b36aa08dc9397b8b6ef34043b113dc639e8478608ec23b959"

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
