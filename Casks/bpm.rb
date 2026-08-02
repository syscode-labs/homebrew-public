cask "bpm" do
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v#{version}/BpmTray_v#{version}_darwin_arm64.zip"
      sha256 "487ebe42866ee519aaba169ba8e4a456c93dd504dace4b6da6d95134871118cb"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v#{version}/BpmTray_v#{version}_darwin_amd64.zip"
      sha256 "4c9e89c997a5fe5c05ce284705c1e7da23936988bf44842223de2e54bc2d21f0"
    end
  end

  name "Bambu Profile Manager (bpm)"
  desc "Copy Bambu Studio filament/process profiles across printers and verify the round trip - CLI + menu bar app"
  homepage "https://github.com/syscode-labs/bambu-profile-manager"

  livecheck do
    skip "Auto-generated on release."
  end

  # Bundle folder includes "(bpm)" - real bug found live: CFBundleName/
  # CFBundleDisplayName don't affect Spotlight matching at all, only the
  # folder's own name does. Without it, searching the product's own short
  # name ("bpm") found nothing and macOS offered a Stocks ticker-lookup
  # suggestion instead.
  app "Bambu Profile Manager (bpm).app"
  binary "#{appdir}/Bambu Profile Manager (bpm).app/Contents/MacOS/bpm"

  # Unsigned/unnotarized (no Apple Developer cert) - without this, Gatekeeper
  # blocks the app with "unidentified developer" the first time you open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Bambu Profile Manager (bpm).app"]
  end

  zap trash: [
    "~/Library/Application Support/bpm",
  ]
end
