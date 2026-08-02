class Bpm < Formula
  desc "Copy Bambu Studio filament/process profiles across printers and verify the round trip"
  homepage "https://github.com/syscode-labs/bambu-profile-manager"
  version "0.3.4"
  license "MIT"

  # macOS: use the "bpm" cask instead (brew install --cask syscode-labs/public/bpm).
  # A Formula can't depend on a Cask and its install step is sandboxed from
  # writing to /Applications at all (both confirmed live) - only the cask
  # can give you the CLI + the menu bar app together in one command.
  on_linux do
    on_arm do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.3.4/bpm_v0.3.4_linux_arm64.tar.gz"
      sha256 "04f42d0d27ec918f152bf294fcdf69b0c8e64855b2b24a0ac93b32e23a9d475f"
    end

    on_intel do
      url "https://github.com/syscode-labs/bambu-profile-manager/releases/download/v0.3.4/bpm_v0.3.4_linux_amd64.tar.gz"
      sha256 "377fb1f8976f3451eeffc73a84d2c2f84be56c8a27ede7e42212e71340487634"
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
