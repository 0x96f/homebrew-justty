cask "justty" do
  version "0.9.0"
  sha256 "f18c0306891e900928548210270214af7f097e60605692f1c71ba98ee354abb8"

  url "https://github.com/0x96f/justty/releases/download/v#{version}/Justty-macos.zip"
  name "Justty"
  desc "Simple native macOS terminal"
  homepage "https://github.com/0x96f/justty"

  depends_on macos: :sequoia

  app "Justty.app"

  # Self-signed / not notarized — clear Gatekeeper quarantine so first launch works.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Justty.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.0x96f.justty.plist",
    "~/Library/Saved Application State/dev.0x96f.justty.savedState",
  ]
end
