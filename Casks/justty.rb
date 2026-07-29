cask "justty" do
  version "0.5.1"
  sha256 "adacb835a0e2ba8b9a39b92eb0fe558a500fa35ef3d9bc665469924722af45a5"

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
