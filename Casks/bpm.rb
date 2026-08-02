cask "bpm" do
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v#{version}/BpmTray_v#{version}_darwin_arm64.zip"
      sha256 "f4f03745316f392bbe0a7594b612efd6e31af93350413f7c10ef958cae75cd13"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v#{version}/BpmTray_v#{version}_darwin_amd64.zip"
      sha256 "22221f62c3a109c3145c3f2c0480e4a196eb89e2ea5c67d03f80e5f21c16febd"
    end
  end

  name "Bambu Profile Manager"
  desc "Copy Bambu Studio filament/process profiles across printers and verify the round trip - CLI + menu bar app"
  homepage "https://github.com/syscode-labs/bambu-profile-manager"

  livecheck do
    skip "Auto-generated on release."
  end

  app "Bambu Profile Manager.app"
  binary "#{appdir}/Bambu Profile Manager.app/Contents/MacOS/bpm"

  # Unsigned/unnotarized (no Apple Developer cert) - without this, Gatekeeper
  # blocks the app with "unidentified developer" the first time you open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Bambu Profile Manager.app"]
  end

  zap trash: [
    "~/Library/Application Support/bpm",
  ]
end
