class Bpm < Formula
  desc "Copy Bambu Studio filament/process profiles across printers and verify the round trip"
  homepage "https://github.com/syscode-labs/bambu-profile-manager"
  version "0.3.3"
  license "MIT"

  # macOS: use the "bpm" cask instead (brew install --cask syscode-labs/public/bpm).
  # A Formula can't depend on a Cask and its install step is sandboxed from
  # writing to /Applications at all (both confirmed live) - only the cask
  # can give you the CLI + the menu bar app together in one command.
  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.3.3/bpm_v0.3.3_linux_arm64.tar.gz"
      sha256 "a2904809153878d343c69b816805f475ed86cfe140c56a76525ec851c32ab9f2"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.3.3/bpm_v0.3.3_linux_amd64.tar.gz"
      sha256 "4f4a615e631cfb256e924e7a14393cfcb0801fe0de1312d0d5c32e2850eaeae1"
    end
  end

  def install
    bin.install "bpm"
  end

  test do
    output = shell_output("#{bin}/bpm 2>&1", 2)
    assert_match "bpm — Bambu Studio profile manager", output
  end
end
