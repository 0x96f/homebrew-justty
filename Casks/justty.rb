cask "justty" do
  version "0.8.1"
  sha256 "501cb32c751e476219c64e101fbd932669fc1e5e582029356f0fdebc4ad66054"

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
