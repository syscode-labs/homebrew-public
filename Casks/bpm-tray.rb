cask "bpm-tray" do
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v#{version}/BpmTray_v#{version}_darwin_arm64.zip"
      sha256 "24629f65d2b44a0d117fc023ff4b7cb432b8e6709b194f60bd25858f72dce4b1"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v#{version}/BpmTray_v#{version}_darwin_amd64.zip"
      sha256 "6b728d9673d894bab7ea39997671da3070b95403a869e73f3ea3c46a29e5e0a8"
    end
  end

  name "Bpm Tray"
  desc "macOS menu bar app for Bambu Profile Manager"
  homepage "https://github.com/syscode-labs/bambu-profile-manager"

  livecheck do
    skip "Auto-generated on release."
  end

  app "BpmTray.app"

  # Unsigned/unnotarized (no Apple Developer cert) - without this, Gatekeeper
  # blocks the app with "unidentified developer" the first time you open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/BpmTray.app"]
  end

  zap trash: [
    "~/Library/Application Support/bpm",
  ]
end
